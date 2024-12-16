# 项目名称

## 项目介绍

这是一个基于 Verilog 的 MIPS 处理器实现项目，包含多个模块如寄存器文件、ALU、数据路径等，用于模拟MIPS指令的执行过程。

## 模块说明

- **sl2.v**: 逻辑左移模块。
- **regfile.v**: 寄存器文件模块。
- **mips.v**: MIPS 处理器顶层模块。
- **datapath.v**: 数据路径模块。
- **alu.v**: 算术逻辑单元模块。
- **adder.v**: 32位加法器模块。
- **clk_div.v**: 时钟分频模块。
- **proc_top.v**: 监控模块。

## 使用说明

1. 使用 Verilog 仿真工具（如 ModelSim）打开项目。
2. 编译所有 Verilog 文件。
3. 运行仿真，观察处理器的行为。
4. 根据需要修改或扩展模块功能。

## 许可证

此项目遵循 MIT 许可证。详情请参阅 [LICENSE](LICENSE) 文件。
