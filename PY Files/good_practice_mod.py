class usefulClass:
	''' This class may be useful '''
	pass

def main():
	useful = usefulClass()
	print (useful)


''' every module has a __name__ special variable
it is the name of the module when it is imported.
when one run python module.py, it is never imported. the __name__ is set to the string "__main__".
Thus make it a policy to wrap all scripts in an if __name__ == '__main__'
in case the function will be imported/used by other code
'''

if __name__ == "__main__":
	main()
	