class Clock {
    constructor() {
        this.date = new Date(); 
        this.hours = this.date.getHours();
        this.minutes = this.date.getMinutes();
        this.seconds = this.date.getSeconds();
        this._tick();
        // 1. Create a Date object.
        // 2. Store the hours, minutes, and seconds.
        // 3. Call printTime.
        // 4. Schedule the tick at 1 second intervals.
    }

    printTime() {
        let time = "";
        
        if (this.hours.toString().length === 2) {
            time += `${this.hours}:`
        } else {
            time += `0${this.hours}:`
        }
        
        if (this.minutes.toString().length === 2) {
            time += `${this.minutes}:`
        } else {
            time += `0${this.minutes}:`
        }
        
        if (this.seconds.toString().length === 2) {
            time += `${this.seconds}`
        } else {
            time += `0${this.seconds}`
        }
        
        console.log(time);
        // Format the time in HH:MM:SS
        // Use console.log to print it.
    }

    _tick() {
        setInterval(() => {
            this.date = new Date();
            this.hours = this.date.getHours();
            this.minutes = this.date.getMinutes();
            this.seconds = this.date.getSeconds();
            this.printTime();
        }, 1000);

        // 1. Increment the time by one second.
        // 2. Call printTime.
    }
}

const clock = new Clock();
