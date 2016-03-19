struct Estado {
	char nombre[1024];
	struct Estado *sig;
};