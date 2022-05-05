<template>
<div>
  <fluent-cardm>
    <h2>{{msg}}</h2>
  </fluent-cardm>
</div>
</template>

<script>
import {
    provideFluentDesignSystem,
    fluentBreadcrumb,
    fluentBreadcrumbItem
} from "@fluentui/web-components";


provideFluentDesignSystem()
    .register(
        fluentBreadcrumb(),
        fluentBreadcrumbItem()
    );
  export default {
    name: 'HelloWorld',
    data(){
      return{
        t1:1
      }
    },
    props: {
      msg: String,
    },
    created(){
      
    },
    methods: {
      
    },
  };
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>

  fluent-cardm {
    padding: 16px;
    display: flex;
    flex-direction: column;
    width:100%;
  }
  h2 {
    font-size: var(--type-ramp-plus-5-font-size);
    line-height: var(--type-ramp-plus-5-line-height);
    padding: 2px;
  }
</style>
