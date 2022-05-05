<template>
    <HelloWorld  msg="Welcome to NEU Library Admin System"/>
    <AdminAdd />
    <AdminSearch />
</template>
 
<script>
import HelloWorld from '@/components/HelloWorld.vue'
import AdminSearch from '@/components/User/AdminSearch.vue'
import AdminAdd from '@/components/User/AdminAdd.vue'

export default {
    name: 'ShowAdmin',
    components:{
      HelloWorld,
      AdminAdd,
      AdminSearch,
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