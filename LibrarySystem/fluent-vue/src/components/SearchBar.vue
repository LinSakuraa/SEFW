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
          <div class="search-book-container"  v-for="book in booklist" :key="book.bookid">
            <div class="search-book-show">
                <div class="search-book-showleft">书籍名称</div>
                <div class="search-book-showright">{{book.bookname}}</div>
            </div>
            <div class="search-book-show">
                <div class="search-book-showleft">书籍编号</div>
                <div class="search-book-showright">{{book.bookid}}</div>
             </div>
            <div class="search-book-show">
                <div class="search-book-showleft">书籍作者</div>
                <div class="search-book-showright">{{book.bookauthor}}</div>
            </div>
            <div class="search-book-show">
                <div class="search-book-showleft">出版社</div>
                <div class="search-book-showright">{{book.bookpublisher}}</div>
            </div>
            <div class="search-book-show">
                <div class="search-book-showleft">类型</div>
            <div class="search-book-showright">{{book.booktag}}</div>
            </div>
            <div class="search-book-show">
              <div style="display:flex;justify-content:center;align-items:center; width:100%; height:100%;">
              <button style="height:30px; width:60px" @click="BorrowBook(book.bookid)">借书</button>
              </div>
            </div>
          </div>
          </div>
        </div>
</template>

<script>
import{defineComponent} from "vue";
import { useMessage } from 'naive-ui';
export default defineComponent({
name:'SearchBar',
props:{},
data(){return{
  buttonText:'书名',
  inputText:'',
  booklist:[],
  showSearch:false,
  message:useMessage()
}},
component:{},
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
   else{
     this.searchTag(this.inputText)
   }
  },
  BorrowBook(bookid){
    if(this.$store.state.isLogin==false){
      this.message.error('请先登录再借书！');
    }else(this.getBorrowBook(bookid))
  },


    //以下为涉及axios调用的方法
    /****************************************************************/
    //ajax请求 方法
  searchName(Name){//方法：get  发送Name 返回对象数组
    //ajax request: search bookName
    console.log(Name);
    this.booklist=[];
    {//axios发送AJAX请求
      this.axios.get('book/find?bookName='+Name).then((response)=>{
        for(let i=0;i<response.data.length;i++)
        {
          this.booklist.push(
                {
                bookid:response.data[i].bookID,
                bookname:response.data[i].bookName,
                bookauthor:response.data[i].bookAuthorName,
                bookpublisher:response.data[i].bookPublisher,
                booktag:response.data[i].type,
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

  },

  searchTag(Tag){//方法：get  发送Type 返回对象数组
    //ajax request  search bookTag
    this.booklist=[];

        {//axios发送AJAX请求
      this.axios.get('book/find?Type='+Tag).then((response)=>{
        for(let i=0;i<response.data.length;i++)
        {
          this.booklist.push(
                {
                bookid:response.data[i].bookID,
                bookname:response.data[i].bookName,
                bookauthor:response.data[i].bookAuthorName,
                bookpublisher:response.data[i].bookPublisher,
                booktag:response.data[i].type,
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
  },
  getBorrowBook(bookid){//方法：get  发送userid,bookid 返回借书情况:boolean
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

    //获取对象数组
  },
setup(){
  return{
   options:[{label:"书名",key:"书名"},
  {label:"类型",key:"类型"}
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
.search-book-container{
  display:flex;
  width:240px;
  height:240px;
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

</style>