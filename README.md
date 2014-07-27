# TP Final Java UTN - Historias Clínicas
=========

## Comandos útiles de git:

Es importante conocer éstos comandos ya que son o fueron usados en el proyecto.
Hay otros comandos y recomendaciones en ésta web: 

http://elbauldelprogramador.com/mini-tutorial-y-chuleta-de-comandos-git/

### git init

Sirve para crear un repo en la carpeta en la que se está actualmente en la consola.

### git status

Muestra el estado del repositorio en el momento.

### git tree

Sirve para ver el árbol de commits y branches.

El comando en realidad es:

```
git log --oneline --decorate --all --graph
```

Y hay que configurar el ALIAS para poder hacer git tree. El alias se 
puede configurar ejecutando por única vez:

```
git config --global alias.tree "log --oneline --decorate --all --graph"
```

Entonces, desde ahora se podrá usar el comando en forma corta: 

```
git tree
```

### gitk

Sirve para ver en forma gráfica el histórico del repo.

### git add <archivo>

Agrega <archivo> al estado intermedio del repositorio.
Para agregar todos los archivos con cambios se puede hacer:

```
git add .
```

### git commit -m <mensaje>

Aplica los cambios realizados al estado intermedio.

### git fetch <remote>

Descarga lo nuevo del repositorio remoto al repo en la máquina, sin sobreescribir lo de
la máquina.

### git pull <remote>

Descarga lo del repositorio haciendo un fetch y hace un merge. 
Osea que intenta combinar lo de la máquina con lo del servidor.

### git push <remote-name> <branch-name>

Sube los cambios realizados a la rama en el servidor remoto. Siempre es bueno
hacer un git pull antes de un push por si alguien hizo cambios en el servidor antes.

### git clone <linkDelRepo>

Sirve para clonar un repo online. Se crea una carpeta con nombre del repositorio
en el directorio actual. Luego habrá que moverse a la carpeta para ejecutar
comandos para el repositorio.

### git checkout -b <nombreDeLaNuevaRama>

Sirve para crear una rama y cambiar a ella. Es una buena práctica hacer una nueva rama 
para trabajar en local. Lo ideal sería no trabajar directamente sobre la rama "master".
Sinó crear una "dev" y otras y luego hacer merge para unirlas.

### git branch

Lista las ramas actuales.

### git checkout <rama>

Sirve para cambiar de rama.

### git merge <rama>

Mezcla la rama actual con <rama>. Se debe TRAER para unir y no EMPUJAR. Por
lo que primero se debe hacer un git checkout <rama> y luego el git merge <rama>.

### git branch -d <rama>

Elimina la rama.
