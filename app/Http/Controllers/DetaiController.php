<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Requests\DetaiRequest;
use App\Models\LoaidetaiModel;
use App\Models\KinhphiModel;
use App\Models\DetaiModel;
use App\Models\TiendoModel;
use App\Models\ThanhvienModel;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use App\Models\TVhoidongModel;
class DetaiController extends Controller
{
    public function destroy($id)
    {
        try {
            $detai = DetaiModel::find($id);
            if (!$detai) {
                return response()->json(['error' => 'Không tìm thấy đề tài'], 404);
            }
            // Xoá các bản ghi liên quan
            ThanhvienModel::where('id_detai', $id)->delete();
            $tiendos = TiendoModel::where('id_detai', $id)->get();
            foreach ($tiendos as $td) {
                KinhphiModel::where('id_tiendo', $td->id_tiendo)->delete();
            }
            TiendoModel::where('id_detai', $id)->delete();
            // Xoá đề tài
            $detai->delete();
            return response()->json(['success' => true]);
        } catch (\Exception $e) {
            \Log::error('Lỗi xoá đề tài: ' . $e->getMessage());
            return response()->json(['error' => 'Lỗi server: ' . $e->getMessage()], 500);
        }
    }
    // API: Lấy đầy đủ thông tin đề tài và các bảng liên quan
    public function getFullDetail($id)
    {
        try {
            $detai = DetaiModel::with([
                'kinhPhi',
                'thanhVien',
                'tienDo',
                'sanpham',
                'lichvucnghiencuu',
                'loaiDT',
                'thongtincanhan'
            ])->find($id);
            if (!$detai) {
                return response()->json(['error' => 'Không tìm thấy đề tài'], 404);
            }
            return response()->json($detai);
        } catch (\Exception $e) {
            \Log::error('Lỗi lấy chi tiết đề tài: ' . $e->getMessage());
            return response()->json(['error' => 'Lỗi server: ' . $e->getMessage()], 500);
        }
    }
    //controller Giao diện
    function view() {}
    // controller Backend
    public function DangkyDetai(DetaiRequest $request)
    {
        $user = auth()->user();
        $ttcn = $user->thongtincanhan;

        if (!$ttcn) {
            Log::warning('Không có thông tin cá nhân. Gán tạm id_ttcn = user_id', ['user_id' => $user->id]);
            // return response()->json([
            //     'message' => 'Không tìm thấy thông tin cá nhân.',
            // ], 404);
            $id_ttcn = $user->id;
        } else {
            $id_ttcn = $ttcn->id_ttcn;
        }

        if (!$this->kiemTraDK($request)) {
            Log::debug('Không đáp ứng điều kiện đăng ký đề tài', [
                'request' => $request->all(),
                'user_id' => $user->id,
            ]);
            return response()->json([
                'message' => 'Không đáp ứng điều kiện đăng ký đề tài',
            ], 403);
        }

        DB::beginTransaction();
        try {
            Log::debug('Bắt đầu tạo đề tài', [
                'user_id' => $user->id,
                'payload' => $request->all()
            ]);

            $detai = DetaiModel::create([
                'id_ttcn'      => 1,
                'id_lvnc'      => $request->input('linhvuc'),
                'id_loaidt'    => $request->input('loaidetai'),
                'tendetai'     => $request->input('tendetai'),
                'hotenCN'      => $request->input('hovaten'),
                'donvi'        => $request->input('Donvi'),
                'sodt'         => $request->input('Sodienthoai'),
                'email'        => $request->input('Email'),
                'tgbatdau'     => $request->input('TGbatdau') ?? null,
                'tgketthuc'    => $request->input('TGketthuc') ?? null,
                'sogiotg'      => $request->input('Sogiotacgia'),
                'trangthai'    => $request->input('Trangthai'),
                'diemanhgia'   => null,
                'nhanxet'      => null,
            ]);

            Log::debug('Đã tạo đề tài', ['id_detai' => $detai->id_detai]);

            foreach ($request->input('thanhvien', []) as $tv) {
                ThanhvienModel::create([
                    'id_detai'       => $detai->id_detai,
                    'id_ttcn'        => $tv['id_nguoidung'] ?? null,
                    'tenthanhvien'   => $tv['tenthanhvien'],
                    'nhiemvu'        => $tv['nhiemvu'],
                    'vaitro'         => $tv['vaitro'] ?? null,
                    'sogiothamgia'   => $tv['sogio'],
                ]);
            }
            Log::debug('Đã thêm thành viên');

            foreach ($request->input('tiendo', []) as $td) {
                $tiendo = TiendoModel::create([
                    'id_detai'   => $detai->id_detai,
                    'ndcongviec' => $td['ndcongviec'],
                    'nguoithuchien' => $td['nguoithuchien'],
                    'thang' => $td['thang'],
                    'tgbatdau'   => $td['Tgbatdaucv'] ?? null,
                    'tgketthuc'  => $td['Tgketthuccv'] ?? null,
                    'trangthai'  => $td['trangthai'],
                ]);

                foreach ($td['kinhphi'] ?? [] as $kp) {
                    KinhphiModel::create([
                        'id_detai'     => $detai->id_detai,
                        'id_tiendo'    => $tiendo->id_tiendo,
                        'ctkhoanchi'   => $kp['noidungchi'],
                        'donvitinh'    => $kp['DVT'],
                        'soluong'      => $kp['Soluong'],
                        'dongia'       => $kp['dongia'],
                        'thanhtien'    => $kp['thanhtien'],
                    ]);
                }
            }
            Log::debug('Đã thêm tiến độ và kinh phí');

            DB::commit();
            Log::debug('Hoàn tất');

            return response()->json([
                'message' => 'Đăng ký đề tài thành công!',
                // 'data' => $detai
            ], 201);
        } catch (\Exception $e) {
            DB::rollBack();
            Log::error('Lỗi khi đăng ký đề tài', [
                'error' => $e->getMessage(),
                'trace' => $e->getTraceAsString(),
                'request' => $request->all(),
            ]);

            return response()->json([
                'message' => 'Lỗi khi đăng ký đề tài',
                'error' => $e->getMessage()
            ], 500);
        }
    }

    //Kiểm tra logic
    protected function kiemTraDK(DetaiRequest $request): bool
    {
        $idloai = $request->input('loaidetai');
        $loaiDT = LoaidetaiModel::find($idloai);
        if (!$loaiDT) {
            Log::debug("Không tìm thấy loại đề tài với id: $idloai");
            return false;
        }
        $soLuongThanhVien = count($request->input('thanhvien', []));
        $tongSoGioTV = collect($request->input('thanhvien', []))->sum('sogio');
        $soGioTacGia = (int) $request->input('Sogiotacgia', 0);

        $gioTG = $loaiDT->sogioTGtoida;
        $soTVtoida = $loaiDT->soTVtoida;
        $sogioTVtoida = $loaiDT->sogioTVtoida;
        if ($soGioTacGia > $gioTG) {
            Log::debug("Sogiotacgia > sogioNC");
            return false;
        }
        if ($tongSoGioTV > $sogioTVtoida) {
            Log::debug("Tổng sogio TV > sogioTVtoida");
            return false;
        }
        if ($soLuongThanhVien > $soTVtoida) {
            Log::debug("số TV > sốTVtoida");
            return false;
        }
        return true;
    }
}
