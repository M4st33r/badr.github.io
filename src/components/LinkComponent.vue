<template>
  <div class="link">
    <a  @click="link_clicked()"  v-if=isSelected  class="selected" >
        <i :class="icon"></i>
        &nbsp;
        {{ text }} 
    </a>

    <a  @click="link_clicked()"  v-else>
        <i :class="icon"></i>
        &nbsp;
        {{ text }} 
    </a>
  </div>
</template>
<script>
  export default {
    name: 'LinkComponent',
    props: {
      text : String,
      icon : String,
      id   : Number,
      isSelected : Boolean,
    },
    methods: {
      link_clicked() {
        this.$emit('link-clicked', this.id);
      },
      emits: ["link-clicked"]
    }
  }
</script>
<style scoped>
  a {
    padding: 15px;
    font-size: 0.80em;
    color: #a6a7a8;
    width: 100%;
    font-family: 'Poppins';
    margin-right: 20px;
    border-radius: 2px;
    -webkit-touch-callout: none;
    -webkit-user-select: none;
    -khtml-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
    margin-top: 2px;
    margin-left: 6px;
  }
  a:hover {
    background-color: #303c54;
    color: #f3f4f7;
    border-left : 2px solid cyan;
  }
  .selected {
    background-color: #303c54;
    color: #f3f4f7;
    border-left : 2px solid cyan;
    -webkit-touch-callout: none;
    -webkit-user-select: none;
    -khtml-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
  }

  .link {
    width: 100%;
    display: flex;
    justify-content: space-around;
    background-color: #3c4b64;
  }

 @media only screen and (max-width: 900px) {
  a {
    font-size: 0.4em;
  }
 }
</style>
