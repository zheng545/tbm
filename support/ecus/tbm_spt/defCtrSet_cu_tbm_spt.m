%++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
%  vehicle control setting for TBM
%++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


enable_BTS_simuDrBrk = true;
    enable_TBM_modfBrk    = true;   % modify brake; for now, this one is useless unless simuDrBrk is set true; 
enable_EPS_distb     = false;
enable_TBM_suspCtr   = false;

    
                     %       1                 2                      3              4                5      6      7      8    
CtrSet_tbm_enab_x8 = [enable_TBM_modfBrk  enable_BTS_simuDrBrk  enable_EPS_distb  enable_TBM_suspCtr  false  false  false  false];
               clear  enable_TBM_modfBrk  enable_BTS_simuDrBrk  enable_EPS_distb  enable_TBM_supsCtr
