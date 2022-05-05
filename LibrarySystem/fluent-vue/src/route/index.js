import {createRouter,createWebHashHistory} from "vue-router";
import ShowAdmin from '@/components/User/ShowAdmin.vue'
import ShowCustomer from '@/components/User/ShowCustomer.vue'
import HoriRoll from '@/components/HoriRoll.vue'
import SearchBar from '@/components/SearchBar.vue'
import PersonSpace from '@/components/PersonSpace.vue'

const routes = [
    {
        path:'/',
        redirect:'/Customer',
    },
    {
        name:'Admin',
        path:'/Admin',
        component:ShowAdmin,
    },
    {
        path:'/Customer',
        component:ShowCustomer,
        redirect:'/Customer/Default',
        children: [
            {
                path:'Default',
                component:HoriRoll,
            },
            {
                path:'Search',
                component:SearchBar,
            },
            {
                path:'Space',
                component:PersonSpace,
            }
        ]
    },
]
export const router = createRouter({
    history: createWebHashHistory(),
    routes:routes
})
export default router