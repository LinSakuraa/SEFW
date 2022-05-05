<template>
<div class="scroll-div">
  <fluent-horizontal-scroll>
  <fluent-card style="cursor:pointer;" v-for="book in booklist" :key="book.bookid" @click="cardClick(book.tagi)">
    <div class="bookname">{{book.bookname}}</div>
    <div class="bookshow">
      <ul class="bookshow-left">
        <li>作者:</li>
        <li>出版社:</li>
        <li>类型:</li>
      </ul>
      <ul class="bookshow-right">
        <li>{{book.bookauthor}}</li>
        <li>{{book.bookpublisher}}</li>
        <li>{{book.booktag}}</li>
      </ul>
    </div>
  </fluent-card>
  </fluent-horizontal-scroll>

</div>
  <ContentBook :showModal="showModal" :book="thisbook" />
</template>

<script>
import {
    provideFluentDesignSystem,
    fluentHorizontalScroll,
    fluentFlipper
} from "@fluentui/web-components";
import { useMessage } from 'naive-ui'

import ContentBook from './DialogContent/ContentBook.vue'

provideFluentDesignSystem()
    .register(
        fluentHorizontalScroll(),
        fluentFlipper()
    );
import {
    fluentListbox,
    fluentOption
} from "@fluentui/web-components";

provideFluentDesignSystem()
    .register(
        fluentListbox(),
        fluentOption()
    );
    export default {
        components:{
      ContentBook
      },
    data(){
      return{
        booklist:[],
        thisbook:null,
        showModal:false,
        bookchanged:false,
        message:useMessage()
      }
    },
    created(){
        //ajax 请求 获取书本信息
      this.getBookList()


      //接收数据并赋值
    },computed:{
      listenLogin(){return this.$store.state.isLogin}
    },
    watch:{
      listenLogin(){
        this.getBookList();//获取新的书本信息 并修改bookList为新内容
      }
    },
    methods:{
      cardClick:function(tagi){
         this.thisbook=this.booklist[tagi];
         this.showModal=!this.showModal;
      },

       //以下为涉及axios调用的方法
    /****************************************************************/
    //ajax请求 方法
      getBookList(){
          this.booklist=[];
        if(this.$store.state.isLogin==true){//已登录 获取个性化内容
        //发送isLogin:true userid:xxx   get方法  userid位于(this.$store.state.user.userid) 
        //返回书本信息
        //书本对象存入booklist中
        console.log(this.$store.state.user.userid);
      this.axios.get('index?userID='+this.$store.state.user.userid).
      then((response)=>{
        console.log(response.data)
            for(let i=0;i<6;i++){
              this.booklist.push(
                {tagi:i,
                bookid:response.data[i].bookID,
                bookname:response.data[i].bookName,
                bookauthor:response.data[i].bookAuthorName,
                bookpublisher:response.data[i].bookPublisher,
                booktag:response.data[i].type,
                }
              )
              }
        //  {this.booklist.push({tagi:i,bookid:5*i,bookname:'Book'+i,bookauthor:'author'+i,bookpublisher:'publisher'+i,booktag:'amusement'})
      }).catch((response)=>{
        console.log(response)
        this.message.error('未能获取书籍信息，请重试！');
      })


        }
        else{//未登录 随机获取书本内容
        //发送isLogin:false   get方法
        //获取书本内容返回

      this.axios.get('index').
      then((response)=>{
        console.log(response.data)
            for(let i=0;i<6;i++){
              this.booklist.push(
                {tagi:i,
                bookid:response.data[i].bookID,
                bookname:response.data[i].bookName,
                bookauthor:response.data[i].bookAuthorName,
                bookpublisher:response.data[i].bookPublisher,
                booktag:response.data[i].type,
                }
              )
              }
        //  {this.booklist.push({tagi:i,bookid:5*i,bookname:'Book'+i,bookauthor:'author'+i,bookpublisher:'publisher'+i,booktag:'amusement'})
      }).catch((response)=>{
        console.log(response)
        this.message.error('未能获取书籍信息，请重试！');
      })
        //书本对象存入booklist中
        }
      },
}
}

</script>

<style>
.bookname{
  width:100%;
  height:20px;
}
.bookshow{
  width:100%;
  height:140px; 
  display:flex;
}
.bookshow-left{
margin:0;
list-style:none;
padding-top:10px;
padding-bottom:10px;
padding-right:5px;
padding-left:5px;
height:120px;
width:50px;
}

.bookshow-left li{
  font-size:12px;
  height:40px;
  width:100%;
  font-weight: bold;
   text-align: center;
  display: flex;
  align-items: center;
  justify-content: center;
}

.bookshow-right{
  margin:0; 
list-style:none;
padding-left:5px;
padding-top:10px;
padding-bottom:10px;
height:120px;
width:110px;
}

.bookshow-right li{
  
  font-size:12px;
  height:40px;
  text-align: center;
  display: flex;
  align-items: center;
  justify-content: center;
}

fluent-listbox{
  float: left;
  
}
fluent-card {
  width: 200px;
  height: 200px;
  padding: 12px;
  display:flex;
  justify-content:center;
  flex-direction:column;
}


fluent-horizontal-scroll {
  min-width: 620px;
  max-width: 860px;
}

.contentdiv{
  height:100px;
  width:100px;
  background-color:black;
  margin-left:200px;
}

.scroll-div{
  width:100%;
  height:auto;
  display:flex;
  justify-content:center;
  align-items: center;
}
</style>