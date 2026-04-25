<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>R.I.D LEGION — Neon Edition</title>
    <link href="https://googleapis.com" rel="stylesheet">
    <style>
        :root {
            --bg: #050208; /* Очень темный фиолетовый */
            --card: #0d0616;
            --accent: #bc13fe; /* Неоновый фиолетовый */
            --accent-glow: #7a00ff;
            --text: #ffffff;
        }

        body {
            background: var(--bg);
            color: var(--text);
            font-family: 'Inter', sans-serif;
            margin: 0;
            line-height: 1.6;
        }

        /* Навигация */
        nav {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 15px 40px;
            background: rgba(13, 6, 22, 0.9);
            border-bottom: 2px solid var(--accent);
            box-shadow: 0 0 15px var(--accent-glow);
            position: sticky;
            top: 0;
            z-index: 1000;
        }

        .logo-container img {
            height: 50px; /* Высота для твоего будущего логотипа */
            display: block;
        }

        .logo-text {
            font-family: 'Orbitron', sans-serif;
            font-size: 1.8rem;
            color: var(--text);
            text-shadow: 0 0 10px var(--accent);
            text-decoration: none;
        }

        /* Кнопки в стиле киберпанк */
        .cyber-btn {
            background: transparent;
            color: var(--text);
            border: 1px solid var(--accent);
            padding: 10px 20px;
            font-family: 'Orbitron', sans-serif;
            font-size: 0.75rem;
            cursor: pointer;
            text-transform: uppercase;
            clip-path: polygon(10% 0, 100% 0, 90% 100%, 0 100%);
            transition: 0.3s;
            margin-left: 10px;
        }

        .cyber-btn:hover {
            background: var(--accent);
            box-shadow: 0 0 20px var(--accent);
            color: black;
        }

        /* Консультанты */
        .staff-section {
            padding: 50px 20px;
            text-align: center;
            background: #080310;
        }

        .staff-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
            margin-top: 30px;
        }

        .staff-card {
            background: var(--card);
            border: 1px solid var(--accent);
            padding: 20px;
            border-radius: 0 20px 0 20px;
            transition: 0.3s;
        }

        .staff-card:hover {
            box-shadow: 0 0 15px var(--accent);
        }

        .staff-role {
            font-family: 'Orbitron', sans-serif;
            color: var(--accent);
            font-size: 0.8rem;
            display: block;
            margin-bottom: 5px;
        }

        /* Товары */
        .grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            gap: 30px;
            padding: 40px;
        }

        .product-card {
            background: var(--card);
            border: 1px solid #221533;
            transition: 0.4s;
            padding-bottom: 20px;
        }

        .product-card:hover {
            border-color: var(--accent);
            box-shadow: 0 0 20px rgba(188, 19, 254, 0.3);
        }

        .buy-btn-main {
            background: var(--accent);
            border: none;
            color: white;
            width: 90%;
            margin: 0 5%;
            padding: 12px;
            font-weight: bold;
            cursor: pointer;
            clip-path: polygon(5% 0, 100% 0, 95% 100%, 0 100%);
        }

        /* Модалки */
        .modal {
            display: none;
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background: #0d0616;
            border: 2px solid var(--accent);
            padding: 30px;
            z-index: 2000;
            width: 90%;
            max-width: 400px;
        }

        input {
            width: 100%;
            background: #1a0b2e;
            border: 1px solid var(--accent);
            color: white;
            padding: 12px;
            margin: 10px 0;
            box-sizing: border-box;
        }
    </style>
</head>
<body>

<nav>
    <div class="logo-container">
        <!-- Когда добавишь файл логотипа, замени src="logo.png" -->
        <a href="#" class="logo-text">R.I.D</a>
    </div>
    <div class="nav-btns">
        <button class="cyber-btn" onclick="toggleView('admin-modal')">Админ</button>
        <button class="cyber-btn" onclick="toggleView('profile-modal')" id="login-btn">Войти</button>
    </div>
</nav>

<div class="container">
    <div class="grid" id="catalog"></div>
</div>

<section class="staff-section">
    <h2 style="font-family: 'Orbitron';">КОМАНДА LEGION</h2>
    <div class="staff-grid">
        <div class="staff-card">
            <span class="staff-role">CONSULTANT #1</span>
            <h3>Владелец</h3>
            <button class="cyber-btn" style="width:100%; margin:0;">Связаться</button>
        </div>
        <div class="staff-card">
            <span class="staff-role">CONSULTANT #2</span>
            <h3>Зам. Владельца</h3>
            <button class="cyber-btn" style="width:100%; margin:0;">Связаться</button>
        </div>
        <div class="staff-card">
            <span class="staff-role">CONSULTANT #3</span>
            <h3>Администратор</h3>
            <button class="cyber-btn" style="width:100%; margin:0;">Связаться</button>
        </div>
    </div>
</section>

<!-- Окна регистрации и админки -->
<div id="profile-modal" class="modal">
    <h2 style="font-family: 'Orbitron'; color: var(--accent);">РЕГИСТРАЦИЯ</h2>
    <input type="text" id="user-name" placeholder="Имя">
    <input type="email" id="user-email" placeholder="Почта">
    <button class="buy-btn-main" onclick="login()">СОЗДАТЬ АККАУНТ</button>
    <button onclick="toggleView('profile-modal')" style="background:none; border:none; color:gray; cursor:pointer; width:100%; margin-top:10px;">Закрыть</button>
</div>

<div id="admin-modal" class="modal">
    <h3 style="font-family: 'Orbitron'">ВХОД ДЛЯ ПЕРСОНАЛА</h3>
    <input type="password" id="admin-pass" placeholder="Пароль">
    <button class="buy-btn-main" onclick="checkAdmin()">ВОЙТИ</button>
    <div id="admin-controls" style="display:none; margin-top:20px;">
        <input type="text" id="p-name" placeholder="Название">
        <input type="text" id="p-price" placeholder="Цена">
        <button class="buy-btn-main" onclick="addItem()">ДОБАВИТЬ</button>
    </div>
    <button onclick="toggleView('admin-modal')" style="background:none; border:none; color:gray; cursor:pointer; width:100%; margin-top:10px;">Закрыть</button>
</div>

<script>
    let products = JSON.parse(localStorage.getItem('rid_neon_prod')) || [
        {name: "Hoodie Phantom", price: "5500 ₽"},
        {name: "Cyber Mask", price: "2200 ₽"}
    ];
    let currentUser = JSON.parse(localStorage.getItem('rid_neon_user')) || null;

    function render() {
        const catalog = document.getElementById('catalog');
        catalog.innerHTML = '';
        products.forEach(p => {
            catalog.innerHTML += `
                <div class="product-card">
                    <div style="height:200px; display:flex; align-items:center; justify-content:center; font-size:4rem; background:#11081d;">📦</div>
                    <div style="padding:20px; text-align:center;">
                        <h3 style="font-family:'Orbitron'">${p.name}</h3>
                        <div style="color:var(--accent); font-weight:bold; font-size:1.4rem; margin:10px 0;">${p.price}</div>
                        <button class="buy-btn-main" onclick="alert('Добавлено!')">КУПИТЬ</button>
                    </div>
                </div>
            `;
        });
        if(currentUser) document.getElementById('login-btn').innerText = currentUser.name.toUpperCase();
    }

    function login() {
        const name = document.getElementById('user-name').value;
        const email = document.getElementById('user-email').value;
        if(name && email) {
            currentUser = {name, email};
            localStorage.setItem('rid_neon_user', JSON.stringify(currentUser));
            toggleView('profile-modal');
            render();
        }
    }

    function toggleView(id) {
        const m = document.getElementById(id);
        m.style.display = m.style.display === 'block' ? 'none' : 'block';
    }

    function checkAdmin() {
        if(document.getElementById('admin-pass').value === 'rid') {
            document.getElementById('admin-controls').style.display = 'block';
        }
    }

    function addItem() {
        const name = document.getElementById('p-name').value;
        const price = document.getElementById('p-price').value;
        if(name && price) {
            products.push({name, price});
            localStorage.setItem('rid_neon_prod', JSON.stringify(products));
            render();
        }
    }

    render();
</script>
</body>
</html>
