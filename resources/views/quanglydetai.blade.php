<div class="dashboard-box">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
   <center> <div class="dashboard-title">Quản lý Đề tài</div></center>
    <div style="display:flex;justify-content:space-between;align-items:center;margin-bottom:8px;gap:8px;">
        <div style="display:flex;align-items:center;gap:8px;">
            <input type="text" id="search-detai" placeholder="Tìm kiếm đề tài..." style="padding:8px 12px;border:1px solid #ccc;border-radius:4px;width:220px;margin-left:0;">
            <button id="btn-search" style="background:#1565c0;color:#fff;border:none;padding:8px 18px;border-radius:4px;cursor:pointer;font-weight:bold;">Tìm kiếm</button>
        </div>
        <button class="btn-add">Thêm</button>
    </div>
    <style>
        html, body {
            height: 100%;
            margin: 0;
            padding: 0;
        }
        .dashboard-box table thead th {
            background: #fff;
            color: #222;
            font-weight: 600;
            padding: 10px 12px;
            border: 1px solid #e0e0e0;
            text-align: left;
        }
        .dashboard-box table tbody td {
            background: #fff;
            color: #222;
            padding: 10px 12px;
            border: 1px solid #e0e0e0;
            font-size: 1rem;
        }
        .dashboard-box {
            background: #fff;
            border-radius: 10px;
            box-shadow: 0 2px 12px rgba(0,0,0,0.09);
            padding: 40px 40px 48px 40px;
            margin: 32px auto;
            max-width: 1400px;
            min-width: 320px;
        }
        .dashboard-box table {
            width: 100%;
            max-width: 100%;
            table-layout: auto;
        }
        /* Button styles */
        .btn-add {
            background: #1976d2;
            color: #fff;
            border: none;
            padding: 8px 24px;
            border-radius: 4px;
            font-weight: bold;
            box-shadow: 0 2px 8px rgba(0,0,0,0.07);
            cursor: pointer;
            transition: background 0.2s;
        }
        .btn-add:hover {
            background: #1565c0;
        }
        .btn-approve {
            background: #fff;
            color: #43a047;
            border: 2px solid #43a047;
            padding: 5px 16px;
            border-radius: 4px;
            font-weight: 500;
            cursor: pointer;
            display: flex;
            align-items: center;
            gap: 6px;
            min-width: 90px;
        }
        .btn-approve.btn-khongduyet {
            background: #fff;
            color: #d32f2f;
            border: 2px solid #d32f2f;
        }
        .btn-approve.btn-khongduyet:hover {
            background: #d32f2f;
            color: #fff;
        }
        .btn-approve:not(.btn-khongduyet):hover {
            background: #43a047;
            color: #fff;
        }
        .btn-edit {
            background: #fff;
            color: #1976d2;
            border: 2px solid #1976d2;
            padding: 5px 16px;
            border-radius: 4px;
            font-weight: 500;
            cursor: pointer;
            display: flex;
            align-items: center;
            gap: 6px;
            min-width: 90px;
        }
        .btn-edit:hover {
            background: #1976d2;
            color: #fff;
        }
        .btn-detail {
            background: #fff;
            color: #1565c0;
            border: 2px solid #1565c0;
            padding: 5px 16px;
            border-radius: 4px;
            font-weight: 500;
            cursor: pointer;
            display: flex;
            align-items: center;
            gap: 6px;
            min-width: 90px;
        }
        .btn-detail:hover {
            background: #1565c0;
            color: #fff;
        }
        .btn-delete {
            background: #fff;
            color: #d32f2f;
            border: 2px solid #d32f2f;
            padding: 5px 16px;
            border-radius: 4px;
            font-weight: 500;
            cursor: pointer;
            display: flex;
            align-items: center;
            gap: 6px;
            min-width: 90px;
        }
        .btn-delete:hover {
            background: #d32f2f;
            color: #fff;
        }
    </style>
    <div id="table-container" style="width:100%;max-width:100%;overflow-x:auto;">
        <div id="detai-table"></div>
    </div>
    <div id="pagination-bar" style="display:flex;justify-content:flex-end;margin-top:12px;"></div>
    <!-- Modal chi tiết đề tài -->
    <div id="modal-detail" style="display:none;position:fixed;top:0;left:0;right:0;bottom:0;width:100%;height:100%;background:rgba(0,0,0,0.45);z-index:9999;align-items:center;justify-content:center;">
        <div style="background:#fff;padding:44px 40px;border-radius:14px;min-width:420px;max-width:700px;box-shadow:0 2px 24px rgba(0,0,0,0.18);position:relative;">
            <button id="close-modal-detail" style="position:absolute;top:12px;right:12px;background:none;border:none;font-size:1.5rem;color:#888;cursor:pointer;"><i class="fa fa-times"></i></button>
            <div id="modal-detail-content"></div>
        </div>
    </div>
    <script>
let detaiData = [];
let currentPage = 1;
let pageSize = 6;
let filteredDetaiData = null;
// Ensure modal is hidden on page load
window.addEventListener('DOMContentLoaded', function() {
    document.getElementById('modal-detail').style.display = 'none';
});

function renderDetaiTable(filteredData = null, page = 1) {
    const tableDiv = document.getElementById('detai-table');
    const data = filteredData || detaiData;
    if (!Array.isArray(data) || data.length === 0) {
        tableDiv.innerHTML = `<table><tr><td colspan="8" style="text-align:center;padding:20px;">Không có dữ liệu đề tài.</td></tr></table>`;
        document.getElementById('pagination-bar').innerHTML = '';
        return;
    }
    const startIdx = (page - 1) * pageSize;
    const endIdx = startIdx + pageSize;
    const pageData = data.slice(startIdx, endIdx);
    let rows = pageData.map(dt => {
        const isApproved = dt.trangthai === 'Đã duyệt';
        const approveClass = isApproved ? 'btn-approve btn-khongduyet' : 'btn-approve';
        return `
        <tr>
            <td style='border:1px solid #e0e0e0;padding:8px;'>${dt.id_detai}</td>
            <td style='border:1px solid #e0e0e0;padding:8px;'>${dt.tendetai}</td>
            <td style='border:1px solid #e0e0e0;padding:8px;'>${dt.hotenCN}</td>
            <td style='border:1px solid #e0e0e0;padding:8px;'>${dt.donvi}</td>
            <td style='border:1px solid #e0e0e0;padding:8px;'>${dt.email}</td>
            <td style='border:1px solid #e0e0e0;padding:8px;'>${dt.tgbatdau ?? ''}</td>
            <td style='border:1px solid #e0e0e0;padding:8px;'>${dt.tgketthuc ?? ''}</td>
            <td style='border:1px solid #e0e0e0;padding:8px;'>${dt.trangthai}</td>
            <td style='border:1px solid #e0e0e0;padding:8px;'>
                <div style='display:flex;gap:4px;'>
                    <button class="${approveClass}" data-id="${dt.id_detai}" data-status="${isApproved ? 'approved' : 'not-approved'}">
                        <i class="fa ${isApproved ? 'fa-times' : 'fa-check'}"></i> ${isApproved ? 'Không duyệt' : 'Duyệt'}
                    </button>
                    <button class="btn-edit"><i class="fa fa-edit"></i> Sửa</button>
                </div>
                <div style='margin-top:4px;display:flex;gap:4px;'>
                    <button class="btn-detail" data-id="${dt.id_detai}"><i class="fa fa-info-circle"></i> Chi tiết</button>
                    <button class="btn-delete" data-id="${dt.id_detai}"><i class="fa fa-trash"></i> Xoá</button>
                </div>
            </td>
        </tr>
        `;
    }).join('');
    tableDiv.innerHTML = `
        <table style="width:100%;margin-top:20px;background:#fff;border-collapse:collapse;box-shadow:0 2px 8px rgba(0,0,0,0.07);">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Tên đề tài</th>
                    <th>Chủ nhiệm</th>
                    <th>Đơn vị</th>
                    <th>Email</th>
                    <th>Thời gian bắt đầu</th>
                    <th>Thời gian kết thúc</th>
                    <th>Trạng thái</th>
                    <th>Thao tác</th>
                </tr>
            </thead>
            <tbody>
                ${rows}
            </tbody>
        </table>
    `;
    renderPagination(data.length, page);
}

function renderPagination(totalItems, page) {
    const totalPages = Math.ceil(totalItems / pageSize);
    if (totalPages <= 1) {
        document.getElementById('pagination-bar').innerHTML = '';
        return;
    }
    let html = `<ul style="display:flex;list-style:none;padding:0;margin:0;gap:2px;">`;
    html += `<li><button ${page === 1 ? 'disabled' : ''} style="border:none;background:#f5f6fa;color:#888;padding:8px 12px;border-radius:4px;cursor:pointer;" onclick="changePage(1)">&laquo;</button></li>`;
    html += `<li><button ${page === 1 ? 'disabled' : ''} style="border:none;background:#f5f6fa;color:#888;padding:8px 12px;border-radius:4px;cursor:pointer;" onclick="changePage(${page-1})">&lsaquo;</button></li>`;
    for(let i=1;i<=totalPages;i++){
        html += `<li><button style="border:none;background:${i===page?'#396cf0':'#fff'};color:${i===page?'#fff':'#396cf0'};padding:8px 12px;border-radius:4px;cursor:pointer;font-weight:500;" onclick="changePage(${i})">${i}</button></li>`;
    }
    html += `<li><button ${page === totalPages ? 'disabled' : ''} style="border:none;background:#f5f6fa;color:#888;padding:8px 12px;border-radius:4px;cursor:pointer;" onclick="changePage(${page+1})">&rsaquo;</button></li>`;
    html += `<li><button ${page === totalPages ? 'disabled' : ''} style="border:none;background:#f5f6fa;color:#888;padding:8px 12px;border-radius:4px;cursor:pointer;" onclick="changePage(${totalPages})">&raquo;</button></li>`;
    html += `</ul>`;
    document.getElementById('pagination-bar').innerHTML = html;
}

window.changePage = function(page) {
    currentPage = page;
    renderDetaiTable(filteredDetaiData || null, currentPage);
}

// Lấy dữ liệu ban đầu khi truy cập trang
fetch('/api/detai/all')
    .then(res => res.json())
    .then(data => {
        detaiData = Array.isArray(data) ? data : [];
        renderDetaiTable();
    })
    .catch(err => {
        console.error('Fetch error:', err);
    });

// Đặt zoom mặc định của trang là 75%
document.body.style.zoom = "75%";
// Xử lý duyệt/không duyệt đề tài
document.addEventListener('click', function(e) {
    if (e.target.closest('.btn-approve')) {
        const btn = e.target.closest('.btn-approve');
        const id = btn.getAttribute('data-id');
        const status = btn.getAttribute('data-status');
        const newStatus = status === 'approved' ? 'Không duyệt' : 'Đã duyệt';
        fetch(`/api/detai/duyet/${id}`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
                'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]')?.getAttribute('content') || ''
            },
            body: JSON.stringify({ trangthai: newStatus })
        })
        .then(res => res.json())
        .then(resp => {
            let arr = filteredDetaiData || detaiData;
            for (let i = 0; i < arr.length; i++) {
                if (arr[i].id_detai == id) {
                    arr[i].trangthai = newStatus;
                    break;
                }
            }
            renderDetaiTable(filteredDetaiData || null, currentPage);
        })
        .catch(err => {
            alert('Lỗi cập nhật trạng thái!');
        });
    }
    // Xử lý nút chi tiết
    if (e.target.closest('.btn-detail')) {
        const btn = e.target.closest('.btn-detail');
        const id = btn.getAttribute('data-id');
        // Fetch full detail from backend
        fetch(`/api/detai/${id}/full`)
            .then(res => res.json())
            .then(dt => {
                if (dt.error) {
                    document.getElementById('modal-detail-content').innerHTML = `<div style='color:red;'>${dt.error}</div>`;
                } else {
                    let html = `<h2 style='margin-bottom:16px;'>Chi tiết đề tài</h2>`;
                    html += `<div style='margin-bottom:8px;'><b>ID:</b> ${dt.id_detai}</div>`;
                    html += `<div style='margin-bottom:8px;'><b>Tên đề tài:</b> ${dt.tendetai}</div>`;
                    html += `<div style='margin-bottom:8px;'><b>Chủ nhiệm:</b> ${dt.hotenCN}</div>`;
                    html += `<div style='margin-bottom:8px;'><b>Đơn vị:</b> ${dt.donvi}</div>`;
                    html += `<div style='margin-bottom:8px;'><b>Email:</b> ${dt.email}</div>`;
                    html += `<div style='margin-bottom:8px;'><b>Thời gian bắt đầu:</b> ${dt.tgbatdau ?? ''}</div>`;
                    html += `<div style='margin-bottom:8px;'><b>Thời gian kết thúc:</b> ${dt.tgketthuc ?? ''}</div>`;
                    html += `<div style='margin-bottom:8px;'><b>Trạng thái:</b> ${dt.trangthai}</div>`;
                    // Related data (indent sections)
                    html += `<hr>
                        <div style='margin-bottom:8px;'>
                            <b>Thành viên:</b>
                            <div style='margin-left:32px;'>
                                <ul style='margin:0;padding-left:18px;'>`;
                    if (dt.thanh_vien && dt.thanh_vien.length) {
                        dt.thanh_vien.forEach(tv => {
                            html += `<li>${tv.tenthanhvien} (${tv.nhiemvu}${tv.vaitro ? ', Vai trò: ' + tv.vaitro : ''})</li>`;
                        });
                    } else {
                        html += `<li>Không có thành viên</li>`;
                    }
                    html += `</ul>
                            </div>
                        </div>`;
                    html += `<div style='margin-bottom:8px;'>
                            <b>Tiến độ:</b>
                            <div style='margin-left:32px;'>
                                <ul style='margin:0;padding-left:18px;'>`;
                    if (dt.tien_do && dt.tien_do.length) {
                        dt.tien_do.forEach(td => {
                            html += `<li>${td.ndcongviec} (${td.trangthai})</li>`;
                        });
                    } else {
                        html += `<li>Không có tiến độ</li>`;
                    }
                    html += `</ul>
                            </div>
                        </div>`;
                    // Kinh phí
                    html += `<div style='margin-bottom:8px;'>
                            <b>Kinh phí:</b>
                            <div style='margin-left:32px;'>
                                <ul style='margin:0;padding-left:18px;'>`;
                    let tongKinhPhi = 0;
                    if (dt.kinh_phi && dt.kinh_phi.length) {
                        dt.kinh_phi.forEach(kp => {
                            html += `<li>${kp.ctkhoanchi}: ${kp.thanhtien} (${kp.donvitinh})</li>`;
                            tongKinhPhi += parseFloat(kp.thanhtien) || 0;
                        });
                        html += `</ul>
                                <div style='margin-top:8px;font-weight:bold;'>Tổng kinh phí: ${tongKinhPhi.toLocaleString('vi-VN', {style: 'currency', currency: 'VND'})}</div>
                            </div>
                        </div>`;
                    } else {
                        html += `<li>Không có kinh phí</li></ul></div></div>`;
                    }
                    html += `<div style='margin-bottom:8px;'>
                            <b>Sản phẩm:</b>
                            <div style='margin-left:32px;'>
                                <ul style='margin:0;padding-left:18px;'>`;
                    if (dt.sanpham && dt.sanpham.length) {
                        dt.sanpham.forEach(sp => {
                            html += `<li>${sp.tensanpham}</li>`;
                        });
                    } else {
                        html += `<li>Không có sản phẩm</li>`;
                    }
                    html += `</ul>
                            </div>
                        </div>`;
                    html += `<div style='margin-bottom:8px;'><b>Lĩnh vực nghiên cứu:</b> ${dt.lichvucnghiencuu ? dt.lichvucnghiencuu.tenlvnc : ''}</div>`;
                    html += `<div style='margin-bottom:8px;'><b>Loại đề tài:</b> `;
                    if (dt.loai_d_t && (dt.loai_d_t.tenloaidetai || dt.loai_d_t.tenloaidt)) {
                        html += dt.loai_d_t.tenloaidetai ?? dt.loai_d_t.tenloaidt;
                    } else if (dt.loaiDT && (dt.loaiDT.tenloaidetai || dt.loaiDT.tenloaidt)) {
                        html += dt.loaiDT.tenloaidetai ?? dt.loaiDT.tenloaidt;
                    } else {
                        html += 'Không xác định';
                    }
                    html += `</div>`;
                    document.getElementById('modal-detail-content').innerHTML = html;
                }
                document.getElementById('modal-detail').style.display = 'flex';
                var closeBtn = document.getElementById('close-modal-detail');
                if (closeBtn) {
                    closeBtn.onclick = function() {
                        document.getElementById('modal-detail').style.display = 'none';
                    };
                }
            })
            .catch(err => {
                document.getElementById('modal-detail-content').innerHTML = `<div style='color:red;'>Lỗi lấy chi tiết đề tài!</div>`;
                document.getElementById('modal-detail').style.display = 'flex';
            });
    }
    // Xử lý nút xoá đề tài
    if (e.target.closest('.btn-delete')) {
        const btn = e.target.closest('.btn-delete');
        const id = btn.getAttribute('data-id');
        // Kiểm tra id hợp lệ trước khi gọi API xoá
        if (!id || id === 'null' || id === 'undefined') {
            alert('Không xác định được đề tài cần xoá!');
            return;
        }
        if (confirm('Bạn có chắc chắn muốn xoá đề tài này?')) {
            fetch(`/api/detai/${id}`, {
                method: 'DELETE',
                headers: {
                    'Content-Type': 'application/json',
                    'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]')?.getAttribute('content') || ''
                }
            })
            .then(res => res.json())
            .then(resp => {
                if (resp.success) {
                    // Xoá khỏi mảng dữ liệu và render lại bảng
                    let arr = filteredDetaiData || detaiData;
                    const idx = arr.findIndex(dt => dt.id_detai == id);
                    if (idx !== -1) {
                        arr.splice(idx, 1);
                        renderDetaiTable(filteredDetaiData || null, currentPage);
                    }
                    alert('Xoá đề tài thành công!');
                } else {
                    alert('Lỗi xoá đề tài!');
                }
            })
            .catch(err => {
                alert('Lỗi xoá đề tài!');
            });
        }
    }
// Đóng modal chi tiết
// Đảm bảo modal chi tiết chỉ mở khi click nút 'Chi tiết'
// Thêm kiểm tra modal-detail và close-modal-detail tồn tại trước khi gán sự kiện
window.addEventListener('DOMContentLoaded', function() {
    var modal = document.getElementById('modal-detail');
    var closeBtn = document.getElementById('close-modal-detail');
    if (modal) modal.style.display = 'none';
    if (closeBtn) {
        closeBtn.addEventListener('click', function() {
            modal.style.display = 'none';
        });
    }
});
});

// Xử lý tìm kiếm
document.getElementById('btn-search').addEventListener('click', function() {
    const keyword = document.getElementById('search-detai').value.trim().toLowerCase();
    if (!keyword) {
        filteredDetaiData = null;
        currentPage = 1;
        renderDetaiTable(null, currentPage);
        return;
    }
    filteredDetaiData = detaiData.filter(dt =>
        (dt.tendetai && dt.tendetai.toLowerCase().includes(keyword))
    );
    currentPage = 1;
    renderDetaiTable(filteredDetaiData, currentPage);
});
</script>
