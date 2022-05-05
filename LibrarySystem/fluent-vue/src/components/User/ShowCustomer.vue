<template>
    <HelloWorld  msg="Welcome to NEU Library System"/>
    <OtherWeb/>
    <router-view></router-view>
</template>

<script>
import HelloWorld from '@/components/HelloWorld.vue'
import OtherWeb from '@/components/OtherWeb.vue'

export default {
    name: 'ShowCustomer',
    components:{
      HelloWorld,
      OtherWeb,
      },
    data(){
        return{
          
        }
    },
    methods:{

    },
};

</script>

<style>
  fluent-divider {
  font-family: sans-serif;
  padding: 4px;
}
</style>