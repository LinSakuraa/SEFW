<template>
  <n-loading-bar-provider>
  <n-message-provider>
    <n-notification-provider>
      <n-dialog-provider>
  <HeadPage/>
  <router-view></router-view>
      </n-dialog-provider>
    </n-notification-provider>
  </n-message-provider>
</n-loading-bar-provider>
</template>

<script>
import HeadPage from './components/HeadPage.vue'
import { defineComponent } from "vue";
export default defineComponent({
  name: 'App',

  components: {
    HeadPage
  }
})

</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top:0px;
}


</style>
