<template>
    <nav class="navbar" role="navigation" aria-label="main navigation">
        <div class="navbar-brand">
            <a class="navbar-item">
                <img class="icon" src="../icon/icons8-books-64.png">
                <p><strong>LEARNWELL</strong></p>
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
                    <a class="button is-link is-outlined"><router-link v-bind:to="{name: 'register'}"><strong>Register</strong></router-link></a>
                    <a class="button is-white"><router-link v-bind:to="{name: 'login'}"><strong>Login</strong></router-link></a>
                    
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

</style>