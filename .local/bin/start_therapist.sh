#!/bin/bash

sysctl -w kernel.yama.ptrace_scope=0
dwarftherapist
sysctl -w kernel.yama.ptrace_scope=1
