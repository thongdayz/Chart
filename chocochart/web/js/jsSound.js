
class JSSound {
    constructor() {
        this.id = ""
        this.isPlayingSound = false
        this.soundAudio = new Howl({
            src: ['assets/sound/notification.mp3'],
            //loop: [true],
            onplay: (val) => { },
            onstop: (val) => { }
        })
    }

    playSound() {
        try {
            this.id = this.soundAudio.play()
            this.isPlayingSound = true
        } catch (error) {
            console.error(error)
        }

    }

    stopSound() {
        try {
            // protect error stop without this.soundAudio.play
            if (this.isPlayingSound) {
                this.isPlayingSound = false
                this.soundAudio.stop(this.id)
            }
        } catch (error) {
            console.error(error)
        }
    }
}
window.JSSound = JSSound
