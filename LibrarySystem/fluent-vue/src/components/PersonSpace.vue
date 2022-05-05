<template>
  <div class="div-space">
      <div class="space-choose">
          <n-button  strong secondary type="info"  class="choose-button"  @click="Change1">
            个人信息
          </n-button>
          <n-button  strong secondary type="info"  class="choose-button"  @click="Change2">
            借书情况
          </n-button>
          <n-button  strong secondary type="info"  class="choose-button"  @click="Change3">
            还书情况
          </n-button>
      </div>
      <div class="show-space">


        <div class="show-data" v-if="showChoose==false&&showReturn==false">
          <div class="data-div">
            <div class="show-list">
              <div class="list-left">账号</div>
              <div class="list-right">{{user.userid}}</div>
            </div>
            <div class="show-list">
              <div class="list-left">用户名</div>
              <div class="list-right">{{user.userName}}</div>
              <div class="change-data">
                <img src="@/assets/change.jpeg" @click="changeUserName">
              </div>
            </div>
            <div class="show-list">
              <div class="list-left">密码</div>
              <div class="list-right">{{user.password}}</div>
              <div class="change-data">
                <img src="@/assets/change.jpeg" @click="changePassword">
              </div>
            </div>
          </div>
            <n-modal
              v-model:show="showModalUserName"
              class="custom-card"
              preset="card"
              :style="bodyStyle"
              title="修改用户名"
              :mask-closable="false"
              size="huge"
              :bordered="false"
              :segmented="segmented"
              >
              <template #header-extra>
              </template>
              <div class="modalA">
                <div class="modal-changeUserName">
                  <div class="input-headtext">用户名：</div>
                  <input class="input-change" type="text" v-model="username"  placeholder="在此处输入用户名" @blur="usernameOnBluer" />
                  <div v-show="this.wrong1==true" class="wrong-text">{{ChangeWrongText1}}</div>
                </div>
                <div class="button-div">
                 <button class="change-button" @click="showModalUserName=false">取消</button>
                  <button class="change-button" @click="SubmitUserName(user.userid)">确认</button>
                </div>
              </div>
            </n-modal>


            <n-modal
              v-model:show="showModalPassword"
              class="custom-card"
              preset="card"
              :style="bodyStyle2"
              title="修改用户名"
              :mask-closable="false"
              size="huge"
              :bordered="false"
              :segmented="segmented"
              >
              <template #header-extra>
              </template>
              <div class="modalB">
                <div class="modal-changePassword">
                    <div class="input-headtext">密码：</div>
                    <input class="input-change" type="password" v-model="password"  placeholder="在此处输入密码" @blur="passwordOnBluer();repeatPasswordOnBluer()" />
                    <div v-show="this.wrong2==true" class="wrong-text">{{ChangeWrongText2}}</div>
                </div>
                <div class="modal-changePassword">
                  <div class="input-headtext">确认密码：</div>
                  <input class="input-change" type="password" v-model="repeatPassword"  placeholder="在此处输入确认密码" @blur="repeatPasswordOnBluer();passwordOnBluer()" />
                  <div v-show="this.wrong3==true" class="wrong-text">{{ChangeWrongText3}}</div>
                </div>
                <div class="button-div">
                 <button class="change-button" @click="showModalPassword=false">取消</button>
                  <button class="change-button" @click="SubmitPassword(user.userid)">确认</button>
                </div>
              </div>
          </n-modal>
        </div>


        <div class="space-div-book" v-if="showChoose==true">
          <div class="space-book-list">
          <div class="space-book-container"  v-for="book in booklist" :key="book.bookID">
            <div class="space-book-show">
                <div class="space-book-showleft">书籍编号</div>
                <div class="space-book-showright">{{book.bookID}}</div>
            </div>
            <div class="space-book-show">
                <div class="space-book-showleft">借书时间</div>
                <div class="space-book-showright">{{getTime(book.borrowDate)}}</div>
            </div>
            <div class="space-book-show">
                <div class="space-book-showleft">借书者账号</div>
                <div class="space-book-showright">{{book.cusID}}</div>
            </div>
            <div class="space-book-show">
              <div style="display:flex;justify-content:center;align-items:center; width:100%; height:100%;">
              <button style="height:30px; width:60px" @click="returnBook(user.userid,book.bookID,book.borrowDate)">还书</button>
              </div>
            </div>
          </div>
          </div>
        </div>

        <div class="space-div-book" v-if="showReturn==true">
          <div class="space-book-list">
          <div class="space-book-container"  v-for="returnBook in returnlist" :key="returnBook.bookID">
            <div class="space-book-show">
                <div class="space-book-showleft">书籍编号</div>
                <div class="space-book-showright">{{returnBook.bookID}}</div>
            </div>
            <div class="space-book-show">
                <div class="space-book-showleft">借书时间</div>
                <div class="space-book-showright">{{getTime(returnBook.borrowDate)}}</div>
            </div>
            <div class="space-book-show">
                <div class="space-book-showleft">借书者账号</div>
                <div class="space-book-showright">{{returnBook.cusID}}</div>
            </div>
            <div class="space-book-show">
               <div class="space-book-showleft">还书时间</div>
                <div class="space-book-showright">{{getTime(returnBook.returnDate)}}</div>
            </div>
          </div>
          </div>
        </div>


      </div>
      
  </div>
</template>

<script>
import { useMessage } from 'naive-ui';
export default {
data(){
  return {
    showChoose:false,
    showReturn:false,
    user:{},
    username:'',
    password:'',
    repeatPassword:'',
    showModalUserName:false,
    showModalPassword:false,
    ChangeWrongText1:'',
    ChangeWrongText2:'',
    ChangeWrongText3:'',
    wrong1:false,
    wrong2:false,
    wrong3:false,
    booklist:[],
    returnlist:[],
    message:useMessage(),
    temptime:'',
  }
},props:{},
created:function(){
  this.user=this.$store.state.user;
  this.getUserMessage(this.user.userid);
  this.getUserRecord(this.user.userid);
},
watch:{},
methods:{
  Change1(){
    this.showChoose = false;
    this.showReturn = false;
  },
  Change2(){
    this.showChoose = true;
    this.showReturn =false;
  },
  Change3(){
     this.showChoose = false;
    this.showReturn = true;
  },
 changeUserName(){
    this.showModalUserName=true;
  },
  changePassword(){
    this.showModalPassword=true;
  },
   usernameOnBluer(){
      console.log('usernameOnBluer');
      if(this.username==''){this.wrong1=true;this.ChangeWrongText1='用户名不能为空'}
      else {this.wrong1=false;this.ChangeWrongText1='';}},
    passwordOnBluer(){
      var reg= /^(?=.*[0-9])(?=.*[a-zA-Z]).{6,16}$/;
      if(this.password==''){this.wrong2=true;this.ChangeWrongText2='密码不能为空'}
      else if(!reg.test(this.password)){this.wrong2=true;this.ChangeWrongText2='密码必须包含字母、数字、且位于6-16位之间'}
      else{this.wrong2=false;this.ChangeWrongText2='';}
    },
    repeatPasswordOnBluer(){
      if(this.repeatPassword==''){this.wrong3=true;this.ChangeWrongText3='确认密码不能为空'}
      else if(this.password==this.repeatPassword){this.wrong3=false;this.ChangeWrongText3='';}
      else{this.wrong3=true;this.ChangeWrongText3='确认密码与密码不一致'}
    },



    //以下为涉及axios调用的方法
    /****************************************************************/
    //ajax请求 方法
SubmitUserName(userid){//方法：修改用户名  发送：用户id 新用户名 

  if(this.wrong1===false)
  {this.axios.post('customer/update',
      {"cusID":userid,
      "cusName":this.username,
      }).then((response)=>{
        if(response.data==1){
          this.message.success('成功修改用户名！');
          this.getUserMessage(userid);
          }
        else{this.message.error('修改失败!');}

      }).catch((response)=>{
        console.log( response)
        this.message.error('服务器未响应!');
      })}
}, 

SubmitPassword(userid){//方法：修改密码  发送：用户id 新密码

   if(this.wrong2===false&&this.wrong3===false){
      this.axios.post('customer/update',
      {"cusID":userid,
      "cusPassword":this.password,
      }).then((response)=>{
        if(response.data==1){
          this.message.success('成功修改密码！');
          this.getUserMessage(userid);
          }
        else{this.message.error('修改失败!');}

      }).catch((response)=>{
        console.log( response)
        this.message.error('服务器未响应!');
      })
   }
}, 
getUserMessage(userid)
{
  if(this.$store.state.isLogin==true){
      this.axios.get('customer/find?cusID='+userid).
      then((response)=>{
        if(response.data.length!=0){
          this.$store.state.user.userName=response.data[0].cusName
          this.$store.state.user.password=response.data[0].cusPassword 
          console.log()
        }
        else{ this.message.error('未能获取用户信息!');}

      }).catch((response)=>{
        this.message.error('服务器未响应!');
      })
  }
  else{this.message.error('未登录！')}
},

 getUserRecord(userid)   //方法 获取用户借书信息  发送 用户id
 {                      //返回结果：书本对象数组
    this.booklist=[];
    this.returnlist=[];
   if(this.$store.state.isLogin==true){
       this.axios.get('borrow/find?cusID='+userid).
      then((response)=>{
        console.log( response)
        if(response.data.length!=0){
          for(let i=0;i<response.data.length;i++)
         {
            if(response.data[i].state==0)
            {
              this.booklist.push(response.data[i]);
            }
            else{
              this.returnlist.push(response.data[i])
              }
            }
            console.log('booklist');
            console.log(this.booklist);
            console.log('returnlist');
            console.log(this.returnlist);
        }
        else{ this.message.error('未能获取借书记录!');}

      }).catch((response)=>{
        console.log( response)
        this.message.error('服务器未响应!');
      })
    //修改booklist
   }else{this.message.error('未登录！')}
 },

 returnBook(userid,bookid,borrowDate)//方法 还书请求 发送 用户id 书本id
 {//返回结果 true/false
  if(this.$store.state.isLogin==true){
       this.axios.post('borrow/update',{
        "bookID":bookid,
        "cusID":userid,
        "borrowDate":borrowDate,
        "returnDate":Date.now(),
        "state":1,
       }).
      then((response)=>{
        console.log( response)
        if(response.data==1){
          this.message.success('还书成功！');
        }
        else{ this.message.error('还书失败！');}

      }).catch((response)=>{
        console.log( response)
        this.message.error('服务器未响应!');
      })
    //修改booklist
   }else{this.message.error('未登录！')}
   //请求失败

/****************************************************************/
 },
 getTime(time){
let date = new Date(time*1);
var Y = date.getFullYear() + '年';
var M = (date.getMonth() + 1 < 10 ? '0' + (date.getMonth() + 1) : date.getMonth() + 1) + '月';
var D = date.getDate();
D = D<10?'0'+D+ '日'+' ':D+ '日'+' '
var h = date.getHours();
h = h < 10 ? '0' + h + ':' : h + ':'
var m = date.getMinutes();
m = m < 10 ? '0' + m : m
let a = Y + M + D + h + m
return a;
 }
},


setup(){
  return{
  bodyStyle: {
        width: "500px"
      },
  bodyStyle2:{
        width: "600px"
  }
  }
}
}
</script>

<style>
.div-space{
    background-color:#fff;
  height:500px;
  width:100%;
  display:flex;
  align-items: center;
  flex-direction:column;

}
.space-choose{
  padding-top:10px;
  height:40px;
  width:160px;
  display:flex;
  justify-content: center;
  align-items: center;
}
.choose-button{
  width:80px;
  height:40px;
}
.show-space{
  margin-top:10px;
  width:100%;
}
.show-data{
  display:flex;
  justify-content: center;
}
.data-div{
  border-radius: 10px;
  background-color:#fafafa;
  height:240px;
  display:flex;
  flex-direction: column;
  width:500px;
}
.show-list{
  height:60px;
  width:500px;
  display:flex;
}
.list-left{ 
  width:100px;
  display:flex;
  justify-content: center;
  align-items: center;
  
}
.list-right{
  width:300px;
  display:flex;
  justify-content: center;
  align-items: center;
}
.change-data{
  padding-left:10px;
  width:60px;
  height:60px;
  display:flex;
  justify-content: center;
  align-items: center;
}
.change-data img{
  height:20px;
  width:20px;
  cursor: pointer;
}
.modal-changeUserName{
  height:100px;
  width:500px;
    display:flex;
justify-content:left;
align-items:center;
}
.modal-changePassword{
  height:100px;
  width:600px;
    display:flex;
justify-content:left;
align-items:center;
}

.input-headtext{
  margin-left:30px;
width:100px;
height:40px;
font-size:18px;
    display:flex;
justify-content:left;
align-items:center;
}

.input-change{
height:40px;
display:inline-block;
width:230px;
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
.modalA{
  display:flex;
justify-content:left;
align-items:center;
flex-direction:column;
}
.button-div{
  height:60px;
  width:100%;
  display:flex;
  justify-content:center;
}
.change-button{
width:60px;
height:30px;
margin-left:40px;
margin-right:40px;
}

.space-div-book{
height:auto;
display:flex;
justify-content:center;
align-items:center;
width:100%
}
.space-book-list{
width:800px;
display:flex;
  flex-wrap:wrap ;
}
.space-book-container{
  display:flex;
  width:240px;
  height:160px;
  flex-direction:column;
  border-radius: 10px;
  background-color:#fafafa;
  margin:10px;

}
.space-book-show{
  width:100%;
  height:40px;
   display:flex;
}
.space-book-showleft{
width:70px;
height:100%;
padding-left:10px;
display:flex;
justify-content:center;
align-items:center;
}
.space-book-showright{
width:140px;
height:100%;
padding-left:10px;
display:flex;
justify-content:center;
align-items:center;
}
</style>