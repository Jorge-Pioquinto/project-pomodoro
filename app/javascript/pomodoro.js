document.addEventListener('DOMContentLoaded', (event) => {
  const startButtons = document.querySelectorAll('[id^="start_"]');

  console.log(`Found ${startButtons.length} start buttons`);

  startButtons.forEach((button) => {
    console.log(`Adding event listener to ${button.id}`);
    button.addEventListener('click', (event) => {
      event.preventDefault();

      console.log(`Start button clicked: ${event.target.id}`);

      const focusTime = event.target.dataset.focusTime * 60;
      const breakTime = event.target.dataset.breakTime * 60;

      console.log(`Focus time: ${focusTime}, Break time: ${breakTime}`);

      startTimer(focusTime, () => {
        alert('Focus time is up!');
        startTimer(breakTime, () => {
          alert('Break time is up!');
        });
      });
    });
  });
});


function startTimer(duration, callback) {
  let timer = duration, minutes, seconds;
  const timerElement = document.getElementById('start-#{pomodoro.id}');
  const intervalId = setInterval(() => {
    minutes = parseInt(timer / 60, 10);
    seconds = parseInt(timer % 60, 10);

    minutes = minutes < 10 ? "0" + minutes : minutes;
    seconds = seconds < 10 ? "0" + seconds : seconds;

    console.log(minutes + ":" + seconds);
    timerElement.textContent = minutes + ":" + seconds; // Update the timer element with the current time

    if (--timer < 0) {
      clearInterval(intervalId);
      callback();
    }
  }, 1000);
}
