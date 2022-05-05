<template>
<div class="login-div">
<div class="button-login" @click="showModal=true">登录</div></div>
  <n-modal
    v-model:show="showModal"
    class="custom-card"
    preset="card"
    :style="bodyStyle"
    title="用户登录"
    :mask-closable="false"
    size="huge"
    :bordered="false"
    :segmented="segmented"
  >
    <template #header-extra>
    </template>
    <div>
      <div class="l-modal-div">
        <div class="login-input-headtext">账号：</div>
        <input class="login-input" type="text" v-model="username"  placeholder="在此处输入账号" @blur="usernameOnBluer" />
        <div v-show="this.wrong1==true" class="wrong-text">{{loginWrongText1}}</div>
      </div>
      <div class="l-modal-div">
        <div class="login-input-headtext">密码：</div>
        <input class="login-input" type="password" v-model="password"  placeholder="在此处输入密码" @blur="passwordOnBluer" />
        <div v-show="this.wrong2==true" class="wrong-text">{{loginWrongText2}}</div>
      </div>
    </div>
    <div style="display:flex;
justify-content:center;
align-items:center;">
      <div style="margin-left:-20px"><n-switch v-model:value="adminActive" />管理员登录</div>
    </div>
      <div class="login-footer-div">
      <button class="login-button" @click="showModal=false">取消</button>
      <button class="login-button" @click="funLogin()">确认</button>
      </div>

  </n-modal>
</template>

<script>
import { defineComponent, ref } from "vue";
import { useMessage } from 'naive-ui'
export default defineComponent({
  methods:{
    usernameOnBluer(){
      if(this.username==''){this.wrong1=true;this.loginWrongText1='账号不能为空'}
      else {this.wrong1=false;this.loginWrongText1='';}

    },
    passwordOnBluer(){
      var reg= /^(?=.*[0-9])(?=.*[a-zA-Z]).{6,16}$/;
      if(this.password==''){this.wrong2=true;this.loginWrongText2='密码不能为空'}
      else if(!reg.test(this.password)){this.wrong2=true;this.loginWrongText2='密码必须包含字母、数字、且位于6-16位之间'}
      else{this.wrong2=false;this.loginWrongText2='';}
    },

     //以下为涉及axios调用的方法
    /****************************************************************/
    //ajax请求 方法
    postUser(userid,password){//axios发送AJAX请求
      this.axios.post('customer/login',
      {"cusID":userid,
      "cusPassword":password
      }).then((response)=>{
        console.log(response)
        if(response.data==1){
          this.message.success('登陆成功！');
          this.$store.state.isLogin=true;
          this.$store.state.user.userid=userid;
          this.$store.state.user.isAdmin=false;
           this.$router.replace("/Customer")
          }
        else{this.message.error('登录失败!');}
      }).catch((response)=>{
        console.log(response)
      })
      this.$store.state.user.isAdmin=false;
    },


    postAdmin(userid,password){//axios发送AJAX请求
      this.axios.post('admin/login',
      {"adminID":userid,
      "adminPassword":password
      }).then((response)=>{
        console.log( response)
        if(response.data==1){
          this.message.success('登陆成功！');
          this.$store.state.isLogin=true;
          this.$store.state.user.userid=userid;
          this.$store.state.user.isAdmin=true;
          this.$router.replace("/Admin");
          }
        else{this.message.error('登录失败!');}

      }).catch((response)=>{
        console.log( response)
      })
    }
  },
  data(){
    return{
     adminActive:false,
    username:'',
    password:'',
    wrong1:false,
    wrong2:false,
    loginWrongText1:'',
    loginWrongText2:'',
    message:useMessage()
    }
  },
  setup() {
      function funLogin(){
        if(this.wrong1===false&&this.wrong2===false){
        this.$store.state.username=this.username;
        this.$store.state.password=this.password;
        //axios发送AJAX请求
         //发送 this.username this.password
        
        if(this.adminActive==false)
        this.postUser(this.username,this.password)//调用postUser方法发送请求
        else{this.postAdmin(this.username,this.password)}


        // if(this.$store.state.isLogin==true)
        // {console.log( this.$store.state.isLogin); 


        //   if(this.$store.state.user.isAdmin==true)
        //   this.$router.replace("/Admin");
        //   else {
        //     this.$router.replace("/Customer")
        //     }
        // }
        // else{
        //   this.message.error('登录失败')
        // }
        // //登录失败
      }
    }

      
    return {
      funLogin,
      bodyStyle: {
        width: "600px"
      },
      segmented: {
        content: "soft",
        footer: "soft"
      },
      showModal: ref(false)
    };
  }
});

</script>

<style>
.button-login{
text-align:center;
height:30px;
width:100%;
list-style: none;
cursor:pointer;
 line-height:30px;
}

.login-div div:hover{
background-color:#dcdfe6
}

.l-modal-div{
height:80px;
width:100%;
display:flex;
justify-content:left;
align-items:center;
}

.login-input{
height:40px;
display:inline-block;
width:190px;
margin-left:20px;
}

.wrong-text{
  color:red;
  width:150px;
  height:40px;
  margin-left:10px;
  font-size:14px;
display:flex;
justify-content:left;
align-items:center;
}


.login-input-headtext{
width:100px;
height:40px;
margin-left:40px;
font-size:18px;
}

.login-button{
width:60px;
height:30px;
margin-left:40px;
margin-right:40px;
}

.login-footer-div{
  height:60px;
  margin-top:20px;
  display:flex;
  justify-content:center;
}
</style>