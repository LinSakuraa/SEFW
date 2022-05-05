<template>
    <div id="title">
        <div class="title-head">
            <img src="@/assets/user.png" class="user-img" @click="ClickUserimg">
                <div class="button-container">
                        <ContentLogin v-if="this.$store.state.isLogin==false"/>
                        <ContentRegister v-if="this.$store.state.isLogin==false"/>
                        <div v-show="(this.$store.state.isLogin==true)&&(this.$store.state.user.isAdmin!=true)" @click="handlePerson">信息</div>
                        <div v-show="this.$store.state.isLogin==true" @click="ClickLogoff()">注销</div>
                </div>
        </div>
    </div>

</template>

<script>
import { onMounted } from '@vue/runtime-core';
import {useStore} from 'vuex'
import ContentRegister from './DialogContent/ContentRegister.vue'
import ContentLogin from './DialogContent/ContentLogin.vue'
export default {
    name: 'HeadPage',
    setup(){
        const store = useStore();
        onMounted(()=>{console.log(store)})
        return{

        }
    },
    methods:{                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
        ClickLogoff(){
            alert('注销成功'); 
            this.$router.replace('/');
            this.$store.state.isLogin=false;
            this.$store.state.user={};
        },

        handlePerson(){
            this.$router.replace('/Customer/space')
        },

    },
    components:{
      ContentRegister,ContentLogin
      }
    
};
</script>

<style>
.title{
    width:100%;
    height:40px;
}

.title-head{
    width:40px;
    height:40px;
    float:right;
    margin-right:20px;
    position: relative;
    display:block;
     cursor:pointer;
}
.user-img {
    width:40px;
    height:40px;
    margin-right:20px;
}

.button-container{
 height:60px;
 width:60px;
 padding-left:0;
 margin:0;
 margin-top:-68px;
 padding-top:70px;
 margin-left:-10px;
 position: absolute;
 list-style-type:none;
 display:none;
}

.button-container>div{
text-align:center;
height:30px;
width:100%;
list-style: none;
cursor:pointer;
 line-height:30px;
}
.button-container>div:hover{
background-color:#dcdfe6
}


.title-head:hover>div{
 display:block;
}


#title{
    height:40px;
    width:100%;
    margin-top:5px;
    margin-bottom:5px;
    border-bottom: 1px solid #dcdfe6;
}
</style>