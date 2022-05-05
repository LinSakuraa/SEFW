import {createStore} from 'vuex'

//创建store
export default createStore({
state:{
    num:1,
    userName:null,
    password:null,
    token:null,
    user:{
        userid:null,
        isAdmin:false,
        userName:null,
        password:null},
    isLogin:false,
book:[{
    bookname:'',
    bookauthor:'',
    bookpublisher:'',
    booktag:''
    }]

},
getters:{

},
actions:{

    
},
mutations:{

},
})

