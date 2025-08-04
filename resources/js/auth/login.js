document.addEventListener('DOMContentLoaded', function () {
    //
    const loginForm = document.getElementById('login-form');
    const emailInput = document.getElementById('email');
    const passwordInput = document.getElementById('password');
    const errorMessage = document.getElementById('error-message');
    const emailError = document.getElementById('email-error');
    const passwordError = document.getElementById('password-error');
    const loginButton = document.getElementById('btn-login');

    // Hiệu ứng hiện password
    const togglePassword = document.querySelector('.toggle-password');
    if (togglePassword) {
        togglePassword.addEventListener('click', function () {
            const type = passwordInput.getAttribute('type') === 'password' ? 'text' : 'password';
            passwordInput.setAttribute('type', type);
            this.classList.toggle('fa-eye-slash');
            this.classList.toggle('fa-eye');
        });
    }

    // Xử lý đăng nhập
    if (loginButton) {
        loginButton.addEventListener('click', async function (e) {
            e.preventDefault();

            // Reset thông báo lỗi
            errorMessage.style.display = 'none';
            emailError.textContent = '';
            passwordError.textContent = '';

            const email = emailInput.value.trim();
            const password = passwordInput.value.trim();

            if (!email || !password) {
                if (!email) emailError.textContent = 'Vui lòng nhập email';
                if (!password) passwordError.textContent = 'Vui lòng nhập mật khẩu';
                return;
            }
            loginButton.disabled = true;
            loginButton.innerHTML = '<i class="fas fa-spinner fa-spin"></i> Đang đăng nhập...';

            try {
                const response = await fetch('/loginuser', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json',
                        'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]').getAttribute('content')
                    },
                    body: JSON.stringify({
                        email: email,
                        password: password
                    })
                });
                const data = await response.json();
                if (response.ok && data.success) {
                    if (data.role && data.role === 'manager') {
                        window.location.href = '/quangly.blade.php';
                        return;
                    }
                    window.location.href = data.redirect || '/';
                    return;
                }
                if (data.errors) {
                    errorMessage.textContent = data.message;
                    errorMessage.style.display = 'block';
                }
            } catch (error) {
                errorMessage.textContent = 'Trang hết hạn hãy tải lại trang';
                errorMessage.style.display = 'block';
            } finally {
                loginButton.disabled = false;
                loginButton.textContent = 'Đăng nhập';
            }
        });
    }
});