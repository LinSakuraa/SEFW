<template>
<div class="Add-button-div">
<n-button @click="showModal1=true" color="#6ac5ec">新增书籍</n-button>
<n-button @click="showModal2=true" color="#6ac5ec">新增用户</n-button>
</div>

  <n-modal
    v-model:show="showModal1"
    class="custom-card"
    preset="card"
    :style="bodyStyle"
    title="新增书籍"
    :mask-closable="false"
    size="huge"
    :bordered="false"
    :segmented="segmented"
  >
    <div class="Admin-div-book">
        <div class="Admin-container">
            <div class="book-show">
                <div class="showleft">书籍编号</div>
                <div class="showright">
                 <input type="text" v-model="thisbook.bookID"/>
                  </div>
             </div>
            <div class="book-show">
                <div class="showleft">书籍名称</div>
                <div class="showright ">
                  <input type="text" v-model="thisbook.bookName"/>
                  </div>
            </div>
            
            <div class="book-show">
                <div class="showleft">书籍作者</div>
                <div class="showright">
                   <input type="text" v-model="thisbook.bookAuthorName"/>
                  </div>
            </div>
            <div class="book-show">
                <div class="showleft">出版社</div>
                <div class="showright">
                   <input type="text" v-model="thisbook.bookPublisher"/>
                  </div>
            </div>
            <div class="book-show">
                <div class="showleft">类型</div>
            <div class="showright">
               <input type="text" v-model="thisbook.type"/>
              </div>
            </div>
             <div class="book-show">
                <div class="showleft">库存</div>
                <div class="showright">
                   <input type="text" v-model="thisbook.num"/>
                  </div>
            </div>
        </div>
    </div>
    <div class="book-footer-div">
      <button class="book-button" @click="showModal1=false">退出</button>
      <button class="book-button" @click="addBook(thisbook)">确认</button>
      </div>
  </n-modal>
  
  <n-modal
    v-model:show="showModal2"
    class="custom-card"
    preset="card"
    :style="bodyStyle"
    title="新增用户"
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
                    <input type="text" v-model="thisuser.cusID"/></div>
                  </div>
            <div class="change-user-show">
                <div class="change-user-showleft">用户名</div>
                <div class="change-user-showright">
                  <input type="text" v-model="thisuser.cusName"/></div>
            </div>
            
            <div class="change-user-show">
                <div class="change-user-showleft">密码</div>
                <div class="change-user-showleft">
                   <input type="text" v-model="thisuser.cusPassword"/>
                  </div>
            </div>
        </div>
    </div>
    <div class="change-user-footer-div">
      <button class="change-user-button" @click="showModal2=false">退出</button>
      <button class="change-user-button" @click="addUser(thisuser)">确认</button>
      </div>
  </n-modal>


</template>

<script>
import{defineComponent} from "vue";
import { useMessage } from 'naive-ui'

export default defineComponent({
name:'AdminAdd',
props:{},
data(){
    return{
    thisbook:{
        bookID:'',
        bookName:'',
        bookAuthorName:'',
        bookPublisher:'',
        num:'',
        type:'',
    },
    thisuser:{
        cusID:'',
        cusName:'',
        cusPassword:'',
    },
    showModal1:false,
    showModal2:false,
    message:useMessage(),
}
},watch:{

},
methods:{
    addBook(book){
   if(this.$store.state.isLogin==false||this.$store.state.user.isAdmin==false){
      this.message.error('没有权限')
    }
    else if(book.bookID==''||book.bookName==''||book.bookAuthorName==''||book.bookPublisher==''||book.num==''||book.type==''){
        this.message.error('请完整输入书籍信息！')
    }
    else this.submitBook(book)
    },
    addUser(user){
   if(this.$store.state.isLogin==false||this.$store.state.user.isAdmin==false){
      this.message.error('没有权限')
    }
    else if(user.cusID==''||user.cusName==''||user.cusPassword==''){
        this.message.error('请完整输入用户信息！')
    }
    else this.submitUser(user)
    },
    submitBook(book){
    this.axios.post('book/add',book).then((response)=>{
        console.log( response)
        if(response.data==1){
          this.message.success('添加成功!');
        }
        else{ this.message.error('添加失败!');}

      }).catch((response)=>{
        console.log( response)
        this.message.error('服务器未响应!');
      })
    },
    submitUser(user){
    this.axios.post('customer/add',user).then((response)=>{
        console.log( response)
        if(response.data==1){
          this.message.success('添加成功!');
        }
        else{ this.message.error('添加失败!');}

      }).catch((response)=>{
        console.log( response)
        this.message.error('服务器未响应!');
      })
    }
},
setup(){
    return{
        bodyStyle: {
        width: "440px"
      },
      segmented: {
        content: "soft",
        footer: "soft"
      },
    }
}
})
</script>

<style>
.Admin-div-book{
    display:flex; 
    width:100%;
    height:240px;
    justify-content:left;
align-items:center;
}

.Admin-container{
      width:350px;
    height:240px;
    flex-direction:column;
    display:flex;
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

.Add-button-div{
    width:100%;
    height:40px;
    padding-top:5px;
    padding-bottom:5px;
    display:flex;
    justify-content:center;
align-items:center;
}
</style>