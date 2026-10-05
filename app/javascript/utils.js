const buttonWords = ["Save", "Cancel", "Continue", "Submit", "Retry", "Next", "Apply", "Done", "Button", "OK"]
const randomString = () => Math.random().toString(36).substring(2, 4 + Math.floor(Math.random() * 9))

window.showDesignQuality = (quality) => {
  document.querySelectorAll(".design-quality-pane").forEach((pane) => {
    pane.hidden = pane.dataset.designQualityPane !== quality
  })

  document.querySelectorAll("[data-design-quality]").forEach((button) => {
    const selected = button.dataset.designQuality === quality
    button.classList.toggle("active", selected)
    button.setAttribute("aria-pressed", selected)
  })
}

window.randomizeBadInput = (input) => {
  if (input.type === "checkbox") return input.checked = !input.checked
  if (input.type === "range") {
    input.value = Math.floor(Math.random() * (Number(input.max) - Number(input.min) + 1)) + Number(input.min)
    input.parentElement.querySelector("output").textContent = input.value
    return
  }

  input.value = randomString()
}

window.setInterval(() => {
  document.querySelectorAll(".bad-input").forEach(window.randomizeBadInput)
  document.querySelectorAll("[data-button-label]").forEach((button) => button.textContent = buttonWords[Math.floor(Math.random() * buttonWords.length)])
  document.querySelectorAll(".demo-retro-moving-button").forEach((button) => {
    button.style.left = `${Math.floor(Math.random() * Math.max(0, button.parentElement.clientWidth - button.offsetWidth))}px`
    button.style.top = `${Math.floor(Math.random() * Math.max(0, button.parentElement.clientHeight - button.offsetHeight))}px`
  })
}, 500)
