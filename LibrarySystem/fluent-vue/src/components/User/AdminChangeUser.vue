<template>
  <n-modal
    v-model:show="showM1"
    class="custom-card"
    preset="card"
    :style="bodyStyle"
    title="修改用户"
    :mask-closable="false"
    size="huge"
    :bordered="false"
    :segmented="segmented"
  >
    <div class="change-user-div">
        <div class="change-user-container">
            <div class="change-user-show">
                <div class="change-user-showleft">账号</div>
                <div class="change-user-showright">
                  {{thisuser.userid}}
                  </div>
             </div>
            <div class="change-user-show">
                <div class="change-user-showleft">用户名</div>
                <div class="change-user-showright">
                  <input type="text" v-model="thisuser.username"/></div>
            </div>
            
            <div class="change-user-show">
                <div class="change-user-showleft">密码</div>
                <div class="change-user-showleft">
                   <input type="text" v-model="thisuser.password"/>
                  </div>
            </div>
        </div>
    </div>
    <div class="change-user-footer-div">
      <button class="change-user-button" @click="showM1=false">退出</button>
      <button class="change-user-button" @click="submitUserChange(thisuser)">确认</button>
      </div>
  </n-modal>
</template>

<script>
import { defineComponent} from "vue";
import { useMessage } from 'naive-ui'
export default defineComponent({
  props:['showModal','user'],
  methods:{

      //方法提交用户信息
       submitUserChange(thisuser){
    if(this.$store.state.isLogin==false||this.$store.state.user.isAdmin==false){
      this.message.error('没有权限')
    }else{
    this.axios.post('customer/update',//axios发送AJAX请求
    {"cusID":thisuser.userid,
    "cusName":thisuser.username,
    "cusPassword":thisuser.password,
    }
    ).then((response)=>{
        console.log( response)
        if(response.data==1){
          this.message.success('修改成功!');
        }
        else{ this.message.error('修改失败!');}

      }).catch((response)=>{
        console.log( response)
        this.message.error('服务器未响应!');
      })

    }
  },
  
  },
  watch:{
      showModal(newName,oldName){
          this.showM1=true;
  },
    user(newName,oldName){
        this.thisuser=newName;
        console.log(this.thisuser);
    }
  
  },
  data(){
    return{
        showM1:false,
        thisuser:{},
        message:useMessage(),
    }
  },
  setup() {
      
    return {
      bodyStyle: {
        width: "440px"
      },
      segmented: {
        content: "soft",
        footer: "soft"
      },
    };
  }
})

</script>

<style>
.change-user-div{
    display:flex; 
    width:100%;
    height:120px;
    justify-content:left;
align-items:center;
}

.change-user-container{
      width:350px;
    height:120px;
    flex-direction:column;
    display:flex;
}

.change-user-show{
width:350px;
height:40px;
display:flex;
justify-content:left;
align-items:center;
}

.change-user-showleft{
width:100px;
height:40px;
display:flex;
justify-content:left;
align-items:center;
}
.change-user-showright{
width:250px;
height:40px;
display:flex;
justify-content:left;
align-items:center;
}

.change-user-footer-div{
  height:60px;
  margin-top:20px;
  display:flex;
  justify-content:center;
}

.change-user-button{
width:60px;
height:30px;
margin-left:40px;
margin-right:40px;
}

</style>