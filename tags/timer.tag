<timer>
  <span>{createTimeText(time)}</span>

  <script type="text/javascript">
    const self = this
    this.time = opts.time
    this.timerID = opts.timerID
    this.observable = opts.observable

    // スタートボタンのイベントを監視
    this.observable.on('start', () => startTimer(self))

    // ストップボタンのイベントを監視
    this.observable.on('stop', () => stopTimer(self))

    // リセットボタンのイベントを監視
    this.observable.on('reset', () => resetTimer(self))

    /**
     * 時間(秒)をテキストに変換
     * @param {number} time タイマーが示す時間の秒数
     */
     this.createTimeText = time => {
      // 秒数から時間を取得
      const hour = second2Hour(time)

      // 秒数から分を取得
      const minute = second2Minute(time)

      // 秒数を60進数に変換
      const second = time - (hour * 3600 + minute * 60)

      // タイマーの時間を示すテキストを生成
      return [hour, minute, second].map(zeroPadding).join(':')
    }

    /*
     * 引数で渡された数値をゼロ埋めした2桁の文字列を返す
     * @param {number} num ゼロ埋めをしたい数値
     * @return ゼロ埋めされた文字列
     */
    function zeroPadding(num) {
      return ('00' + num).slice(-2)
    }

    /**
     * 秒数から時間を取得
     * @param {number} seconds 秒数
     */
    function second2Hour(seconds) {
      return Math.floor(seconds / 3600)
    }

    /**
     * 秒数から分を取得
     * @param {number} seconds 秒数
     */
    function second2Minute(seconds) {
      return Math.floor(seconds / 60)
    }

    /**
     * タイマーを開始する
     */
    function startTimer(timerTag) {
      // 定期実行のタスクが無い時だけ、定期実行を開始
      if(!timerTag.timerID) {
        const timerID = setInterval(() => updateTimer(timerTag), 1000)
        timerTag.update({ timerID })
      }
    }

    /**
     * タイマーを止める
     */
    function stopTimer(timerTag) {
      if(timerTag.timerID) {
        clearInterval(timerTag.timerID)
      }
    }

    /**
     * タイマーをリセットする
     */
    function resetTimer(timerTag) {
      timerTag.update({ time: 0 })
    }

    /**
     * タイマーを1秒更新する
     * @param {number} time 更新前の秒数
     * @return 更新後の秒数
     */
    function updateTimer(timerTag) {
      // 明示的にupdate()を呼ぶ必要がある
      // http://riotjs.com/ja/api/#section-5
      timerTag.update({time: timerTag.time + 1})
    }

  </script>

  <style>
    :scope {
      display: block;
    }

    span {
      font-size: 120px;
      color: white;
    }
  </style>
</timer>
