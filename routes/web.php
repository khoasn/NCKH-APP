
<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\DetaiController;
use App\Http\Controllers\DangNhapController;
use App\Http\Controllers\GiaodienQLController;
use App\Http\Controllers\GiaodienNguoiDungController;
/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/
/*
| Đăng nhập, đăng xuất---------------------------------
*/

Route::post('/loginuser', [DangNhapController::class, 'loginNguoidung']);
/*
| Giao diện---------------------------------------------
*/
Route::get('/', function () {
    return redirect()->route('trangdangnhap');
});
Route::get('/trangdangnhap', [GiaodienNguoiDungController::class, 'TrangDangnhap'])->name('trangdangnhap');
// giao diện admin
Route::get('/admin/trangquanly', [GiaodienQLController::class, 'dashboardAdmin']);
// giao diện quản lý hệ thống
Route::get('/quanlyhethong/trangquanly', function () {
    return view('quangly');
});
// trả về partial cho quản lý đề tài
Route::get('/quanglydetai-partial', function () {
    return view('quanglydetai');
});
// test trực tiếp giao diện quanglydetai
Route::get('/test-quanglydetai', function () {
    return view('quanglydetai');
});
//chuyen trang den quangly
Route::get('/quangly.blade.php', function () {
    return view('quangly');
});
//Đề tài
route::post('/pdangkydetai', [DetaiController::class, 'DangkyDetai']);
// API lấy tất cả đề tài cho dashboard quản lý đề tài
Route::get('/api/detai/all', function () {
    return response()->json(\App\Models\DetaiModel::all());
});