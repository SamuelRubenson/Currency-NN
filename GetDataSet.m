function [ Data, pips ] = GetDataSet( iPair,iSet )

  if iPair == 1
    if iSet == 1
      Data = load('EURUSD_15.csv');
      pips = 0.0001;
    elseif iSet == 2
      Data = load('EURUSD_60.csv');
      pips = 0.0001;
    elseif iSet == 3
      Data = load('EURUSD_D.csv');
      pips = 0.0001;
    end
  elseif iPair == 2
    if iSet == 1
      Data = load('GBPUSD_15.csv');
      pips = 0.0001;
    elseif iSet == 2
      Data = load('GBPUSD_60.csv');
      pips = 0.0001;
    elseif iSet == 3
      Data = load('GBPUSD_D.csv');
      pips = 0.0001;
    end
  elseif iPair == 3
    if iSet == 1
      Data = load('AUDUSD_15.csv');
      pips = 0.0001;
    elseif iSet == 2
      Data = load('AUDUSD_60.csv');
      pips = 0.0001;
    elseif iSet == 3
      Data = load('AUDUSD_D.csv');
      pips = 0.0001;
    end
  elseif iPair == 4
    if iSet == 1
      Data = load('NZDUSD_15.csv');
      pips = 0.0001;
    elseif iSet == 2
      Data = load('NZDUSD_60.csv');
      pips = 0.0001;
    elseif iSet == 3
      Data = load('NZDUSD_D.csv');
      pips = 0.0001;
    end
  elseif iPair == 5
    if iSet == 1
      Data = load('USDCAD_15.csv');
      pips = 0.0001;
    elseif iSet == 2
      Data = load('USDCAD_60.csv');
      pips = 0.0001;
    elseif iSet == 3
      Data = load('USDCAD_D.csv');
      pips = 0.0001;
    end
  elseif iPair == 6
    if iSet == 1
      Data = load('USDJPY_15.csv');
      pips = 0.01;
    elseif iSet == 2
      Data = load('USDJPY_60.csv');
      pips = 0.01;
    elseif iSet == 3
      Data = load('USDJPY_D.csv');
      pips = 0.01;
    end
  elseif iPair == 7
    if iSet == 1
      Data = load('EURJPY_15.csv');
      pips = 0.01;
    elseif iSet == 2
      Data = load('EURJPY_60.csv');
      pips = 0.01;
    elseif iSet == 3
      Data = load('EURJPY_D.csv');
      pips = 0.01;
    end
  elseif iPair == 8
    if iSet == 1
      Data = load('GBPJPY_15.csv');
      pips = 0.01;
    elseif iSet == 2
      Data = load('GBPJPY_60.csv');
      pips = 0.01;
    elseif iSet == 3
      Data = load('GBPJPY_D.csv');
      pips = 0.01;
    end
  end
    
end

