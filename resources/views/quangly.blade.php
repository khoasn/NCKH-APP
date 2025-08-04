
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản lý NCKH - Dashboard</title>
    <style>
        body { font-family: Arial, sans-serif; background: #f5f6fa; margin: 0; }
        .sidebar {
            width: 220px;
            background: #1565c0;
            color: #fff;
            position: fixed;
            top: 0; left: 0; bottom: 0;
            padding-top: 30px;
        }
        .sidebar h2 { text-align: center; margin-bottom: 30px; font-size: 22px; }
        .sidebar ul { list-style: none; padding: 0; }
        .sidebar ul li { padding: 15px 30px; cursor: pointer; display: flex; align-items: center; }
        .sidebar ul li:hover { background: #1976d2; }
        .sidebar ul li i { margin-right: 10px; }
        .main {
            margin-left: 220px;
            padding: 40px;
        }
        .dashboard-box {
            background: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.07);
            padding: 30px;
        }
        .dashboard-title {
            font-size: 28px;
            font-weight: bold;
            margin-bottom: 10px;
        }
        .dashboard-role {
            color: #1976d2;
            font-size: 18px;
            margin-bottom: 20px;
        }
    </style>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>
    <div class="sidebar">
        <h2>Quản lý NCKH</h2>
        <ul>
            <li><i class="fas fa-tachometer-alt"></i> Dashboard</li>
            <li><i class="fas fa-tasks"></i> Quản lý Đề tài</li>
            <li><i class="fas fa-file-export"></i> Xuất dữ liệu</li>
            <li id="logout-btn" style="color:#ffc107;"><i class="fas fa-sign-out-alt"></i> Đăng xuất</li>
        </ul>
    </div>
    <div class="main" id="main-content">
        <div id="dashboard-content">
            <div class="dashboard-box">
                <div class="dashboard-title">Dashboard</div>
                <div class="dashboard-role">MANAGER---</div>
                <p>Chào mừng bạn đến trang quản lý. Đây là giao diện dashboard dành cho Manager.</p>
            </div>
        </div>
    </div>

<script>
    document.getElementById('logout-btn').addEventListener('click', function() {
        window.location.href = '/trangdangnhap';
    });

    document.querySelector('li:nth-child(2)').addEventListener('click', function() {
        fetch('/quanglydetai-partial')
            .then(response => response.text())
            .then(html => {
                const mainContent = document.getElementById('main-content');
                mainContent.innerHTML = html;

                // Thực thi lại các script trong html vừa chèn
                const scripts = mainContent.querySelectorAll('script');
                scripts.forEach(oldScript => {
                    const newScript = document.createElement('script');
                    if (oldScript.src) {
                        newScript.src = oldScript.src;
                    } else {
                        newScript.textContent = oldScript.textContent;
                    }
                    document.body.appendChild(newScript);
                });

                // Gọi hàm renderDetaiTable nếu có
                if (typeof renderDetaiTable === 'function') {
                    renderDetaiTable();
                }
            });
    });
</script>
</body>
</html>
