Name: Bowen Zheng  
Edited on 06/05/2023  
**Overview**  
This project focuses on developing safety-critical algorithms designed
to handle high-speed tire blowouts. The algorithms integrate braking,
steering, and suspension systems to enhance overall vehicle safety and
performance. The key components and files of this project are outlined
below.  
**Project Files**

1.  mVeh_fun_tbm.prj: This is the main project file. Opening this file
    ensures that all necessary components and dependencies for the
    Simulink model are preloaded and accessible.

2.  **mVeh_fun_tbm.slx**: This is the primary Simulink model file. It is
    used with Speedgoat HIL (Hardware-in-the-Loop) systems for
    simulation and vehicle testing. The model is divided into three main
    sections:

    - **Read**: Requires the dbc files from the vehicle for reading
      data.

    - **Process**: Contains the core algorithms for handling braking,
      steering, and suspension systems during a tire blowout. The main
      processing block is `cu_tbm` which references `tbm_ref`.

    - **Send**: Requires the dbc files from the vehicle for sending
      processed data back to the vehicle systems.  
      **Key Components**

- TBM (Tire Blowout Mechanism): This component is the core of the
  project, focusing on managing the vehicle's response during a tire
  blowout.

- **Speedgoat HIL**: The model is tested using Speedgoat HIL systems to
  ensure real-time simulation and validation with actual vehicle
  hardware.  

**Security Notice**  
  For security reasons, the original dbc files used for reading and
  sending data are not included in this repository. Ensure you have the
  necessary dbc files from your vehicle to properly utilize the `Read`
  and `Send` sections of the Simulink model.  

**How to Use**

1.  Open the `mVeh_fun_tbm.prj` file to preload all necessary components
    and environment.

2.  Open the `mVeh_fun_tbm.slx` file in MATLAB Simulink.

3.  Ensure the vehicle's dbc files are available for the `Read` and
    `Send` sections.

4.  Run the simulation or connect to Speedgoat HIL for real-time
    testing.
