
<?php
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Models\DetaiModel;
// API cập nhật trạng thái duyệt/không duyệt đề tài
Route::post('/detai/duyet/{id}', function(Request $request, $id) {
    $detai = DetaiModel::find($id);
    if (!$detai) {
        return response()->json(['error' => 'Không tìm thấy đề tài'], 404);
    }
    $trangthai = $request->input('trangthai');
    $detai->trangthai = $trangthai;
    $detai->save();
    return response()->json(['success' => true, 'trangthai' => $trangthai]);
});
/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});
// API lấy đầy đủ thông tin đề tài và các bảng liên quan
use App\Http\Controllers\DetaiController;
Route::get('/detai/{id}/full', [DetaiController::class, 'getFullDetail']);
Route::delete('/detai/{id}', [DetaiController::class, 'destroy']);
