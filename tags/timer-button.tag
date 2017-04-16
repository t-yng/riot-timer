<timer-button>
  <button type="button" onclick={ click }>{opts.title}</button>

  <script type="text/javascript">
    this.observable = opts.observable
    this.event = opts.event

    this.click = () => {
      this.observable.trigger(this.event)
    }
  </script>

  <style media="screen">
    button {
      font-size: 30px;
      padding-left: 15px;
      padding-right: 15px;
    }
  </style>
</timer-button>
