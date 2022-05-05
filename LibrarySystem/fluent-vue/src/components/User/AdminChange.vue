<template>
  <n-modal
    v-model:show="showM1"
    class="custom-card"
    preset="card"
    :style="bodyStyle"
    title="修改书籍"
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
                  {{thisbook.bookid}}
                  </div>
             </div>
            <div class="book-show">
                <div class="showleft">书籍名称</div>
                <div class="showright ">
                  <input type="text" v-model="thisbook.bookname"/></div>
            </div>
            
            <div class="book-show">
                <div class="showleft">书籍作者</div>
                <div class="showright">
                   <input type="text" v-model="thisbook.bookauthor"/>
                  </div>
            </div>
            <div class="book-show">
                <div class="showleft">出版社</div>
                <div class="showright">
                   <input type="text" v-model="thisbook.bookpublisher"/>
                  </div>
            </div>
            <div class="book-show">
                <div class="showleft">类型</div>
            <div class="showright">
               <input type="text" v-model="thisbook.booktag"/>
              </div>
            </div>
             <div class="book-show">
                <div class="showleft">库存</div>
                <div class="showright">
                   <input type="text" v-model="thisbook.booknum"/>
                  </div>
            </div>
        </div>
    </div>
    <div class="book-footer-div">
      <button class="book-button" @click="showM1=false">退出</button>
      <button class="book-button" @click="submitBookChange(thisbook)">确认</button>
      </div>
  </n-modal>
</template>

<script>
import { defineComponent} from "vue";
import { useMessage } from 'naive-ui'

export default defineComponent({
  props:['showModal','book'],
  methods:{


       submitBookChange(thisbook){
    if(this.$store.state.isLogin==false||this.$store.state.user.isAdmin==false){
      this.message.error('没有权限')
    }else{
    this.axios.post('book/update',
    {"bookID":thisbook.bookid,
    "bookName":thisbook.bookname,
    "bookAuthorName":thisbook.bookauthor,
    "bookPublisher":thisbook.bookpublisher,
    "num":thisbook.booknum,
    "type":thisbook.booktag,
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

      //发送ajax this.thisbook

    }
  },
  
  },
  watch:{
      showModal(newName,oldName){
          this.showM1=true;
  },
    book(newName,oldName){
        this.thisbook=newName;
        console.log(this.thisbook);
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

</style>