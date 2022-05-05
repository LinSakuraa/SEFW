<template>
  <div class="div-SearchBar">
  <div class="Search-handle">
    <div class="choose-div">
      <n-dropdown trigger="hover" :options="options" @select="handleSelect">
    <n-button class="choose-button" color="#6ac5ec">{{buttonText}}</n-button>
  </n-dropdown>
    </div>
    <div class="input-div">
      <input v-model="inputText" class="input-bar"/>
    </div>
    <div class="button-div">
        <n-button class="submit-button" @click="submitInput" color="#6ac5ec">搜索</n-button>
      </div>
  </div>
  </div>


  <div class="search-div-book" v-show="showSearch">
          <div class="search-book-list">
          <div class="Admin-book-container"  v-for="book in booklist" :key="book.bookid">
              <div class="search-book-show">
                <div class="search-book-showleft">书籍编号</div>
                <div class="search-book-showright">
                  <div>{{book.bookid}}</div>
                </div>
             </div>
             <div class="search-book-show">
                <div class="search-book-showleft" >书籍名称</div>
                <div class="search-book-showright">
                  <div>{{book.bookname}}</div>
                  </div>
             </div>
             <div class="search-book-show">
                <div class="search-book-showleft">书籍作者</div>
                <div class="search-book-showright">
                  <div>{{book.bookauthor}}</div>
             </div>
             </div>
             <div class="search-book-show">
                <div class="search-book-showleft">出版社</div>
                <div class="search-book-showright">
                  <div>{{book.bookpublisher}}</div>
                  </div>
             </div>
             <div class="search-book-show">
                <div class="search-book-showleft">类型</div>
             <div class="search-book-showright">
               <div>{{book.booktag}}</div>
               </div>
            </div>
            <div class="search-book-show">
                <div class="search-book-showleft">库存</div>
             <div class="search-book-showright">
               <div>{{book.booknum}}</div>
               </div>
            </div>
             <div class="search-book-show">
              <div style="display:flex;justify-content:center;align-items:center; width:100%; height:100%;">
              <div><button style="height:30px; width:40px margin-left:10px;margin-right:10px;" @click="DeleteBook(book.bookid)">删除</button></div>
              <div><button style="height:30px; width:40px margin-left:10px;margin-right:10px;" @click="ChangeBook(book.tagi)">修改</button></div>
              </div>
             </div>
          </div>
        

          <div class="search-user-container" v-for="user in userlist" :key="user.userid">
            <div class="search-book-show">
                <div class="search-book-showleft">账号</div>
                <div class="search-book-showright">{{user.userid}}</div>
             </div>
             <div class="search-book-show">
                <div class="search-book-showleft">用户名</div>
                <div class="search-book-showright">{{user.username}}</div>
             </div>
             <div class="search-book-show">
                <div class="search-book-showleft">密码</div>
                <div class="search-book-showright">{{user.password}}</div>
             </div>
                <div class="search-book-show">
              <div style="display:flex;justify-content:center;align-items:center; width:100%; height:100%;">
              <div><button style="height:30px; width:40px margin-left:10px;margin-right:10px;" @click="DeleteUser(user.userid)">删除</button></div>
              <div><button style="height:30px; width:40px margin-left:10px;margin-right:10px;" @click="ChangeUser(user.tagi)">修改</button></div>
              </div>
             </div>
             </div>
          </div>

             
        </div>
        <AdminChange :showModal="showModalBook" :book="thisbook"/>
        <AdminChangeUser :showModal="showModalUser" :user="thisuser"/>
</template>

<script>
import{defineComponent} from "vue";
import AdminChange from '@/components/User/AdminChange.vue'
import AdminChangeUser from '@/components/User/AdminChangeUser.vue'
import { useMessage } from 'naive-ui'
export default defineComponent({
name:'AdminSearch',
components:{
  AdminChange,AdminChangeUser
  },
props:{},
data(){return{
  buttonText:'书名',
  inputText:'',
  booklist:[],
  userlist:[],
  showSearch:false,
  showUser:false,
  showModalBook:false,
  showModalUser:false,
  thisbook:{},
  thisuser:{},
  message:useMessage()
}},

watch:{
},
methods:{


  handleSelect(key){
      this.buttonText=key;
    },


  submitInput(){
   if(this.buttonText=='书名'){
     this.searchName(this.inputText)
   }
   else if(this.buttonText=='类型'){
     this.searchTag(this.inputText)
   }
   else if(this.buttonText=='账号'){
       this.searchUser(this.inputText)
   }
  },


    //以下为涉及axios调用的方法
    /****************************************************************/
    //ajax请求 方法
  searchName(Name){//方法：get  发送Name 返回对象数组
    //ajax request: search bookName
   if(this.$store.state.isLogin==true&&this.$store.state.user.isAdmin==true){
    this.userlist=[];
    this.booklist=[];// 清空当前显示的数据
    
    {//axios发送AJAX请求
      this.axios.get('book/find?bookName='+Name).then((response)=>{
        for(let i=0;i<response.data.length;i++)
        {
          this.booklist.push(
                {
                tagi:i,
                bookid:response.data[i].bookID,
                bookname:response.data[i].bookName,
                bookauthor:response.data[i].bookAuthorName,
                bookpublisher:response.data[i].bookPublisher,
                booktag:response.data[i].type,
                booknum:response.data[i].num,
                }
              )
        }
        console.log(response)

      }).catch((response)=>{
        console.log(response)
      })
    }

    //1.成功搜索到结果
    //获取对象数组 显示相应结果
    this.showSearch=true

    //2.未找到
    // this.showSearch=false;//不显示结果区域


    //发送警告
    }
    else(this.message.error('没有权限'))
  },

  searchTag(Tag){//方法：get  发送Name 返回对象数组
    //ajax request  search bookTag
if(this.$store.state.isLogin==true&&this.$store.state.user.isAdmin==true){

    this.userlist=[];
    this.booklist=[];// 清空当前显示的数据

    {//axios发送AJAX请求
      this.axios.get('book/find?Type='+Tag).then((response)=>{
        for(let i=0;i<response.data.length;i++)
        {
          this.booklist.push(
                {
                tagi:i,
                bookid:response.data[i].bookID,
                bookname:response.data[i].bookName,
                bookauthor:response.data[i].bookAuthorName,
                bookpublisher:response.data[i].bookPublisher,
                booktag:response.data[i].type,
                booknum:response.data[i].num,
                }
              )
        }
        console.log(response)
        
      }).catch((response)=>{
        console.log(response)
      })
    }

 //1.成功搜索到结果
    //获取对象数组 显示相应结果
    this.showSearch=true

    //2.未找到
      //this.showSearch=false;//不显示结果区域
    

    //发送警告
    }else(this.message.error('没有权限'))
  },

  searchUser(User){//方法：post  发送 userid 返回对象数组
    //ajax request  search User
if(this.$store.state.isLogin==true&&this.$store.state.user.isAdmin==true){
    this.userlist=[];
    this.booklist=[];// 清空当前显示的数据

    {//axios发送AJAX请求 
      this.axios.get('customer/find?cusID='+User).
      then((response)=>{
        console.log( response)
        if(response.data.length!=0){
        for(let i=0;i<response.data.length;i++)
        {
          this.userlist.push(
                {
                tagi:i,
                userid:response.data[i].cusID,
                username:response.data[i].cusName,
                password:response.data[i].cusPassword,
                }
              )
        }}
        else(this.message.error('未找到该用户！'))


      }).catch((response)=>{
        console.log( response)
        this.message.error('未能连接到服务器！')
      })
    }

    this.showSearch=true;

    //  this.userlist.push({tagi:0,userid:User,username:'自豪简一郎',password:'114514'})

 //1.成功搜索到结果
    //获取对象数组 显示相应结果
    this.showSearch=true

    //2.未找到
    //this.showSearch=false;//不显示结果区域


    //发送警告
  }else(this.message.error('没有权限'))
  },



  //change function
  //管理员修改相关方法
  ChangeBook(tagi){
    this.thisbook=this.booklist[tagi];
    this.showModalBook=!this.showModalBook;
  },
  DeleteBook(bookid){
    //删除 bookid 对应的书籍
    this.axios.get('book/delelteById?bookID='+bookid).then((response)=>{
        if(response.data==1){
          this.message.success('删除成功!');
        }
        else{ this.message.error('删除失败!');}
      }).catch((response)=>{
        this.message.error('服务器未响应!');
      })
  },
  ChangeUser(tagi){
    console.log(this.thisuser);
    this.thisuser=this.userlist[tagi];
    this.showModalUser=!this.showModalUser;
  },
  DeleteUser(userid){
    this.axios.get('customer/delelteById?cusID='+userid).then((response)=>{
        if(response.data==1){
          this.message.success('删除成功!');
        }
        else{ this.message.error('删除失败!');}
      }).catch((response)=>{
        this.message.error('服务器未响应!');
      })
  }
  },
setup(){
  return{
   options:[{label:"书名",key:"书名"},
  {label:"类型",key:"类型"},
  {label:"账号",key:"账号"}
    ],
  }
}
}
)
</script>

<style>
.div-SearchBar{
  display: flex;
  height:auto;
  width:100%;
  justify-content: center;
}
.Search-handle{
  margin-top:10px;
  display:flex;
  height:40px;
  width:480px;
  justify-content: center;
  align-items: center;
}
.choose-div{
height:40px;
width:60px;
display:flex;
justify-content: center;
align-items: center;
}

.choose-button{
  height:40px;
width:60px;
display:flex;
justify-content: center;
align-items: center;
}

.input-div{
height:40px;
width:300px;
padding-left:20px;
}
.input-bar{
  height:38px;
width:300px;
padding:0;
padding-left:10px;
border:1px solid #b0b3b8;

}

.button-div{
margin-left:10px;
height:40px;
width:60px;
display:flex;
justify-content: center;
align-items: center;
}

.submit-button{
height:40px;
width:60px;
display:flex;
justify-content: center;
align-items: center;
}

.search-div-book{
height:auto;
display:flex;
justify-content:center;
align-items:center;
width:100%
}
.search-book-list{
width:800px;
display:flex;
  flex-wrap:wrap ;
}
.Admin-book-container{
  display:flex;
  width:240px;
  height:300px;
  flex-direction:column;
  border-radius: 10px;
  background-color:#fafafa;
  margin:10px;

}
.search-book-show{
  width:100%;
  height:40px;
   display:flex;
}
.search-book-showleft{
width:70px;
height:100%;
padding-left:10px;
display:flex;
justify-content:center;
align-items:center;
}
.search-book-showright{
width:140px;
height:100%;
padding-left:10px;
display:flex;
justify-content:center;
align-items:center;
}

.search-user-container{
  display:flex;
  width:240px;
  height:200px;
  flex-direction:column;
  border-radius: 10px;
  background-color:#fafafa;
  margin:10px;

}
</style>