# Scripts

Generic scripts to perform a diverse tasks

## Dell Update

### Requeriments

Install (Dell Command Update)[https://www.dell.com/support/article/en-us/sln311129/dell-command-update] 

Install PowerShell Windows Update module

```bash
> Install-module PSWindowsUpdate
> Import-Module PSWindowsUpdate
> Get-command -module PSWindowsUpdate
```

Install (Chocolatey)[https://chocolatey.org/] package manager

```bash
> Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
```

### Execution

```bash
> powershell -executionpolicy bypass -File updateDell.ps1
```
