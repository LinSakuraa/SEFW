<template>
  <n-modal
    v-model:show="showM1"
    class="custom-card"
    preset="card"
    :style="bodyStyle"
    title="借阅图书"
    :mask-closable="false"
    size="huge"
    :bordered="false"
    :segmented="segmented"
  >
    <template #header-extra>
    </template>
    <div class="div-book">
        <div class="book-container">
            <div class="book-show">
                <div class="showleft">书籍名称</div>
                <div class="showright">{{thisbook.bookname}}</div>
            </div>
            <div class="book-show">
                <div class="showleft">书籍编号</div>
                <div class="showright">{{thisbook.bookid}}</div>
             </div>
            <div class="book-show">
                <div class="showleft">书籍作者</div>
                <div class="showright">{{thisbook.bookauthor}}</div>
            </div>
            <div class="book-show">
                <div class="showleft">出版社</div>
                <div class="showright">{{thisbook.bookpublisher}}</div>
            </div>
            <div class="book-show">
                <div class="showleft">类型</div>
            <div class="showright">{{thisbook.booktag}}</div>
            </div>
        </div>
        <div class="bookimg">
            <img src="" style="height:160px;width:160px"/>
        </div>
     </div>
    <div class="book-footer-div">
      <button class="book-button" @click="showM1=false">退出</button>
      <button class="book-button" @click="borrowBook(thisbook.bookid)">借阅</button>
      </div>
  </n-modal>
</template>

<script>
import { defineComponent} from "vue";
import { useMessage } from 'naive-ui';

export default defineComponent({
  props:['showModal','book'],
  methods:{
       borrowBook(bookid){
    if(this.$store.state.isLogin==false){
      this.message.error('请先登录再借书')
    }else{this.getBorrowBook(bookid)}
  },
  
    //以下为涉及axios调用的方法
    /****************************************************************/
    //ajax请求 方法
  getBorrowBook(bookid){//方法：get  发送userid,bookid,time,state 返回借书情况:boolean
    console.log(Date.now());
    this.axios.post('borrow/add',
    {"cusID":this.$store.state.user.userid,
    "bookID":bookid,
    "borrowDate":Date.now(),
    "state":0}
    ).then((response)=>{
        console.log( response)
        if(response.data==1){
          this.message.success('借书成功!');
        }
        else{ this.message.error('借书失败!');}

      }).catch((response)=>{
        console.log( response)
        this.message.error('服务器未响应!');
      })
  }
  },
  watch:{
      showModal(newName,oldName){
          this.showM1=true;
  },
    book(newName,oldName){
        this.thisbook=newName;
    }
  
  },
  data(){
    return{
        showM1:false,
        thisbook:{},
        message:useMessage()
    }
  },
  setup() {
      function funBook(){

        //axios发送AJAX请求


        
        //请求接收完毕 登录成功
        //登录失败
    }
      

    return {
      funBook,
      bodyStyle: {
        width: "600px"
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
.div-book{
    display:flex; 
    width:100%;
    height:200px;
    justify-content:left;
align-items:center;
}
.book-container{
    flex-direction:column;
    display:flex;
    width:350px;
    height:200px;
}
.bookimg{
    width:160px;
    height:160px;
}
.book-show{
width:350px;
height:40px;
display:flex;
justify-content:left;
align-items:center;
}

.showleft{
width:100px;
height:40px;
display:flex;
justify-content:left;
align-items:center;
}
.showright{
width:250px;
height:40px;
display:flex;
justify-content:left;
align-items:center;
}

.book-footer-div{
  height:60px;
  margin-top:20px;
  display:flex;
  justify-content:center;
}

.book-button{
width:60px;
height:30px;
margin-left:40px;
margin-right:40px;
}

</style>