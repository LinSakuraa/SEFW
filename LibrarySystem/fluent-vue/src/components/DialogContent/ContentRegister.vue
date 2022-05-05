<template>
<div class="register-div">
<div class="button-register" @click="showModal=true">注册</div></div>
  <n-modal
    v-model:show="showModal"
    class="custom-card"
    preset="card"
    :style="bodyStyle"
    title="用户注册"
    size="huge"
    :mask-closable="false"
    :bordered="false"
    :segmented="segmented"
  >
    <template #header-extra>
    </template>
    <div>
      <div class="r-modal-div">
        <div class="register-input-headtext">账号：</div>
        <input class="register-input" type="text" v-model="username" placeholder="在此处输入账号" @blur="usernameOnBluer"/>
        <div v-show="this.wrong1==true" class="wrong-text">{{loginWrongText1}}</div>
      </div>

        <div class="r-modal-div">
        <div class="register-input-headtext">用户名：</div>
        <input class="register-input" type="text" v-model="nickname" placeholder="在此处输入用户名" @blur="nicknameOnBluer"/>
        <div v-show="this.wrong4==true" class="wrong-text">{{loginWrongText4}}</div>
      </div>

      <div class="r-modal-div">
        <div class="register-input-headtext">密码：</div>
        <input class="register-input" type="password" v-model="password" placeholder="在此处输入密码" @blur="passwordOnBluer();repeatPasswordOnBluer()"/>
        <div v-show="this.wrong2==true" class="wrong-text">{{loginWrongText2}}</div>
      </div>
      <div class="r-modal-div">
        <div class="register-input-headtext">确认密码：</div>
        <input class="register-input" type="password" v-model="repeatPassword" placeholder="在此处输入确认密码" @blur="repeatPasswordOnBluer();passwordOnBluer()"/>
        <div v-show="this.wrong3==true" class="wrong-text">{{loginWrongText3}}</div>
      </div>

    </div>
      <div class="register-footer-div">
      <button class="register-button" @click="showModal=false">取消</button>
      <button class="register-button" @click="funRegister">确认</button>
      </div>
  </n-modal>
</template>

<script>
import { defineComponent, ref } from "vue";

export default defineComponent({
  methods: {
     usernameOnBluer(){
      if(this.username==''){this.wrong1=true;this.loginWrongText1='账号不能为空'}
      else {this.wrong1=false;this.loginWrongText1='';}

    },
     nicknameOnBluer(){
       if(this.nickname==''){this.wrong4=true;this.loginWrongText4='用户名不能为空'}
       else {this.wrong4=false;this.loginWrongText4='';}

    },
    passwordOnBluer(){
      var reg= /^(?=.*[0-9])(?=.*[a-zA-Z]).{6,16}$/;
      if(this.password==''){this.wrong2=true;this.loginWrongText2='密码不能为空'}
      else if(!reg.test(this.password)){this.wrong2=true;this.loginWrongText2='密码必须包含字母、数字、且位于6-16位之间'}
      else{this.wrong2=false;this.loginWrongText2='';}
    },
    repeatPasswordOnBluer(){
      if(this.repeatPassword==''){this.wrong3=true;this.loginWrongText3='确认密码不能为空'}
      else if(this.password==this.repeatPassword){this.wrong3=false;this.loginWrongText3='';}
      else{this.wrong3=true;this.loginWrongText3='确认密码与密码不一致'}
    },

     //以下为涉及axios调用的方法
    /****************************************************************/
    //ajax请求 方法
    postUser(userid,username,password){//axios发送AJAX请求  方法 注册
    alert(userid,username,password)
    let customer={"cusID":userid,
      "cusName":username,
      "cusPassword":password}
      this.axios.post('customer/add', 
      customer).then((response)=>{
        console.log(response)
      }).catch((response)=>{
        console.log(response)
      })
    }
  },
  data(){
    return{
    username:'',
    password:'',
    nickname:'',
    repeatpassword:'',
    wrong1:false,
    wrong2:false,
    wrong3:false,
    wrong4:false,
    loginWrongText1:'',
    loginWrongText2:'',
    loginWrongText3:'',
    loginWrongText4:'',
    }
  },
  setup() {
      function funRegister(){
        if(this.wrong1===false&&this.wrong2===false&&this.wrong3===false&&this.wrong4===false){
          
          this.$store.state.username=this.username;
          this.$store.state.password=this.password;
          //发送ajax请求 post方法
          //发送 this.username this.password
          this.postUser(this.username,this.nickname,this.password)

          
          //接收回调 注册成功
          
          this.$store.state.username=null;
          this.$store.state.password=null;
          //注册失败！
        }
        
      }
    return {
      funRegister,
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
.button-register{
text-align:center;
height:30px;
width:100%;
list-style: none;
cursor:pointer;
 line-height:30px;
}

.register-div div:hover{
background-color:#dcdfe6
}

.r-modal-div{
height:80px;
width:100%;
display:flex;
justify-content:left;
align-items:center;
}

.register-input{
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


.register-input-headtext{
width:100px;
height:40px;
margin-left:40px;
font-size:18px;
}

.register-button{
width:60px;
height:30px;
margin-left:40px;
margin-right:40px;
}

.register-footer-div{
  height:60px;
  margin-top:20px;
  display:flex;
  justify-content:center;
}
</style>