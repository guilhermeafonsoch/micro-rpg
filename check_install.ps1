$env:Path = [System.Environment]::GetEnvironmentVariable('Path','Machine') + ';' + [System.Environment]::GetEnvironmentVariable('Path','User')
Write-Host "=== Checking installations ==="
try { Write-Host "Choco: $(choco --version)" } catch { Write-Host "Choco: NOT FOUND" }
try { $erl = erl -eval 'erlang:display(erlang:system_info(otp_release)), halt().' -noshell 2>&1; Write-Host "Erlang: $erl" } catch { Write-Host "Erlang: NOT FOUND" }
try { Write-Host "Elixir: $(elixir --version 2>&1 | Select-String 'Elixir')" } catch { Write-Host "Elixir: NOT FOUND" }
try { Write-Host "Mix: $(mix --version 2>&1 | Select-String 'Mix')" } catch { Write-Host "Mix: NOT FOUND" }
