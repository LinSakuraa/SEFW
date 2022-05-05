import { createApp } from 'vue'
import App from './App.vue'
import naive from "naive-ui";
import axios from 'axios'
import Vueaxios from 'vue-axios'
import router from './route'
import store from './store'
import { provideFluentDesignSystem, fluentCard, fluentButton } from '@fluentui/web-components';
import {
    fluentSelect,
    fluentOption
} from "@fluentui/web-components";

provideFluentDesignSystem()
    .register(
        fluentSelect(),
        fluentOption()
    );


provideFluentDesignSystem().register(fluentCard(), fluentButton());

const app= createApp(App);
axios.defaults.baseURL='/api'
app.use(Vueaxios,axios);
app.use(router);
app.use(naive);
app.use(store);
app.mount('#app')