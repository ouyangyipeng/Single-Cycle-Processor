# 实验9 单周期处理器实验 代码模板

文件目录：  
```
lab9_code_template   
|-debug_core.v  
|-proc_top.v  //调用了MIPS单周期处理器顶层文件放在\MIPS_core\rtl\top.v，将top信号导入到sys_monitor中。
|-readme.md   
|-sys_monitor.v  
|-uart_rx.v  
|-uart_top.v  
|-uart_tx.v  
```

## 不需要你修改的文件

```
|-debug_core.v  
|-sys_monitor.v  
|-uart_rx.v  
|-uart_top.v  
|-uart_tx.v 
```

这部分是包装好的串口监视器，实现的功能、指令码与操作样例已在实验手册中给出。其中使用的两个 FIFO 例化方式已在 Lab8 中给出，此处不再赘述。  
有兴趣的同学可以自己查看 `debug_core.v` 中实现的指令，自己调整监视器的DEBUG能力。没有在实验手册中给出的指令不保证其运行的正确性。

## 需要引入的文件

MIPS单周期处理器全部放在\MIPS_core\rtl下面
MIPS单周期处理器顶层文件放在\MIPS_core\rtl\top.v里面
要自己看下代码结构

## 需要修改的文件

```
\MIPS_core\rtl下面aludec.v、controller.v、datapath.v（需要自己来连接各个子模块，各个子模块实现已经给出）
例化inst_mem和data_mem

```
|-proc_top.v  //调用了MIPS单周期处理器顶层文件放在\MIPS_core\rtl\top.v，将top信号导入到sys_monitor中。根据显示信号的需要可以自己配置
```

整个处理器的顶层模块，与 Lab8 的修改方式类似。