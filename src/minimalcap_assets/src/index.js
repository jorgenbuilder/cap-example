import { minimalcap } from "../../declarations/minimalcap";

document.getElementById("clickMeBtn").addEventListener("click", async () => {
  const name = document.getElementById("name").value.toString();
  // Interact with minimalcap actor, calling the greet method
  const greeting = await minimalcap.greet(name);

  document.getElementById("greeting").innerText = greeting;
});
