步骤
1、安装dfx
  sh -ci "$(curl -fsSL https://smartcontracts.org/install.sh)"
  
2、检查 principai id
  dfx identity get-principal
  
3、获取 cycles
  dfx canister --network=ic call qp2sd-aiaaa-aaaal-qa7wq-cai redeem '("FCBE9-64BFE-58445")'
  
4、关联钱包
  dfx identity --network=ic set-wallet 7ehwi-ziaaa-aaaak-acqqa-cai
  
5、查询 cycles
  dfx wallet --network=ic balance

6、搭建网站
  6.1、创建 mysite 项目
    dfx new mysite --no-frontend
  
  6.2、进入 mysite 目录
    cd mysite
    
  6.3、启动网站
    dfx start mysite --background
    
  6.5、增加首页
    cat > src/mysite_frontend/assets/index.html
    <html><body><h2>Goodbye, World~</h2></body></html>
    
  6.6、部署
    dfx deploy
    
  6.7、查看前端canister id
    dfx canister id mysite_frontend
   
  6.8、指定cycles部署到链上
    dfx deploy --network=ic --with-cycles=1000000000000
    
