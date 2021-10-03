(async function() {
    await ImGui.default();
    const canvas = document.getElementById("output");
    const devicePixelRatio = window.devicePixelRatio || 1;
    canvas.width = canvas.scrollWidth * devicePixelRatio;
    canvas.height = canvas.scrollHeight * devicePixelRatio;
    window.addEventListener("resize", () => {
      const devicePixelRatio = window.devicePixelRatio || 1;
      canvas.width = canvas.scrollWidth * devicePixelRatio;
      canvas.height = canvas.scrollHeight * devicePixelRatio;
    });
  
    ImGui.CreateContext();
    // ImGui_Impl.Init(canvas);
  
    ImGui.StyleColorsDark();
    //ImGui.StyleColorsClassic();
  
    const clear_color = new ImGui.ImVec4(0.3, 0.3, 0.3, 1.00);
  
    const renderer = new THREE.WebGLRenderer({ canvas: canvas });
    
    const scene = new THREE.Scene();
      
    const camera = new THREE.PerspectiveCamera(50, canvas.width / canvas.height, 0.1, 10000);
      camera.position.set(0, 0, 500);
      scene.add(camera);
    
    const light = new THREE.DirectionalLight(0xffffff, 0.8);
      light.position.set(0, 0, 350);
      light.lookAt(new THREE.Vector3(0, 0, 0));
      scene.add(light);
  
    ImGui_Impl.Init(canvas);
  
    if (Main.ctx.InitCallback != null)
        Main.ctx.InitCallback();

    let done = false;
    window.requestAnimationFrame(_loop);
    function _loop(time) {
      ImGui_Impl.NewFrame(time);
      ImGui.NewFrame();
  
      if (Main.ctx.RenderCallback != null)
        Main.ctx.RenderCallback();
  
      ImGui.Render();
      
      renderer.setClearColor(new THREE.Color(clear_color.x, clear_color.y, clear_color.z), clear_color.w);
      renderer.setSize(canvas.width, canvas.height);
      camera.aspect = canvas.width / canvas.height;
      camera.updateProjectionMatrix();
      renderer.render(scene, camera);
  
      ImGui_Impl.RenderDrawData(ImGui.GetDrawData());
  
      // TODO: restore WebGL state in ImGui Impl
      renderer.state.reset();
  
      window.requestAnimationFrame(done ? _done : _loop);
    }

    function _done() {
        ImGui_Impl.Shutdown();
        ImGui.DestroyContext();
      }
  })();
  