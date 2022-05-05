<template>
    <div class="Change">
       <n-button-group size="small">
      <n-button type="default" color="#3299cc" text-color="white" class="list-group-item" @click="changeToDefault">
        推荐
      </n-button>
      <n-button type="default" color="#3299cc" text-color="white" class="list-group-item" @click="changeToSearch">
        搜索
      </n-button>
    </n-button-group>
    </div>
    <div class="line-div">
       <div class="line"></div>
    </div>
</template>

<script>

export default {

    data(){
      return{
      }
    },
    created(){
    },
    watch:{
    },
    methods:{
      changeToDefault(){
        this.$router.replace('/Customer/Default')
      },
      changeToSearch(){
        this.$router.replace('/Customer/Search')
      },
      }

};

</script>

<style>
.Change{
 margin-bottom:10px;
 height:40px;
 width:100%;
 display:flex;
 justify-content: center;
  align-items:center;
}
.list-group-item{
    width:80px;
    height:40px;
    padding-left:10px;
    padding-right:10px;
}
.line-div{
height:3px;
display:flex;
 justify-content: center;
  align-items:center;
}
.line{
  background-color:#dcdfe6;
  height:1px;
  width:100%;
}

</style>