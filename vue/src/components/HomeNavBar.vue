<template>
    <nav class="navbar" role="navigation" aria-label="main navigation">
        <div class="navbar-brand">
            <a class="navbar-item">
                <img class="icon" src="../icon/icons8-books-64.png">
                <p><router-link v-bind:to="{name:'home'}"><strong>LEARNWELL</strong></router-link></p>
            </a>
            <a role="button" class="navbar-burger" aria-label="menu" aria-expanded="false" data-target="navbarBasicExample">
                <span aria-hidden="true"></span>
                <span aria-hidden="true"></span>
                <span aria-hidden="true"></span>
            </a>
        </div>

        <div class="navbar-end">
            <div class="navbar-item">
                <div class="buttons">
                    <router-link v-bind:to="{name: 'register'}" class="button is-link is-outlined"><strong>Register</strong></router-link>
                    <router-link v-bind:to="{name: 'login'}" class="button is-link"><strong>Login</strong></router-link>
                    
                </div>
            </div>
        </div>
    </nav>
</template>

<script></script>

<style>
.icon{
    height: auto,
}

.navbar{
    min-height: 5.25rem;
}

</style>