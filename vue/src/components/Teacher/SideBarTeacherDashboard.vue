<template>
    <div>
        <h1>Learn Well</h1>
        <h2>Teacher Dashboard</h2>
        <button type="button">Dashboard</button>
        <button type="button">Courses</button>
        <button type="button">Students</button>
        <button type="button">Notifications</button>
        <button type="button">Logout</button>
    </div>
</template>

<script></script>

<style>
    .sidebar button {
  background-color: #04AA6D;
  border: none;
  color: white;
  padding: 15px 32px;
  text-align: center;
  width: 200px;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  cursor: pointer;
}
.sidebar {
    height: 100%;
  width: 200px;
  position: fixed;
  z-index: 1;
  top: 0;
  left: 0;
  background-color: lightgrey;
  overflow-x: hidden;
}
</style>