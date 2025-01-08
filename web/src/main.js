import { createApp } from 'vue';
import App from './App.vue';
import { createPinia } from 'pinia';
import piniaPluginPersistedstate from 'pinia-plugin-persistedstate';
import router from './router/index';

import 'bootstrap/dist/css/bootstrap.min.css';
import "bootstrap-icons/font/bootstrap-icons.css";
import '@vueup/vue-quill/dist/vue-quill.snow.css';

import 'bootstrap';
import { QuillEditor } from '@vueup/vue-quill';

const pinia = createPinia();
pinia.use(piniaPluginPersistedstate);

const app = createApp(App);

app.use(router);
app.use(pinia);
app.component('QuillEditor', QuillEditor);

app.mount('#app');