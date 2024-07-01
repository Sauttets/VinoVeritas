import os


def _generate_Full(path):
    dot_str = ''
    for root, dirs, files in os.walk(path):
        for name in dirs:
            # Füge Unterordner hinzu
            parent_dir = os.path.relpath(root, path)
            if parent_dir == ".":
                parent_dir = os.path.basename(path)
            if '\\' in parent_dir:
                parent_dir = parent_dir.split('\\')[-1]
            dot_str += f'    "{parent_dir}" -> "{name}";\n'
        for name in files:
            # Füge Dateien hinzu
            parent_dir = os.path.relpath(root, path)
            if parent_dir == ".":
                parent_dir = os.path.basename(path)
            if '\\' in parent_dir:
                parent_dir = parent_dir.split('\\')[-1]
            dot_str += f'    "{parent_dir}" -> "{name}";\n'
    
    return dot_str

def _generate_oneLayer(path):
    dot_str = ''
    dot_str += f'    "{os.path.basename(path)}";\n'
    
    # Nur die erste Ebene durchsuchen
    with os.scandir(path) as it:
        for entry in it:
            dot_str += f'    "{os.path.basename(path)}" -> "{entry.name}";\n'
    return dot_str

# Beispielpfad
path = 'C:/Users/wiebk/OneDrive/Dokumente/Studium/Konstanz/Sem_5/MobieleAnwendungen/VinoVeritas'
dir = ['assets', 'lib', 'test']



def generate_DOT(path):
    dot_str = 'digraph G {\n'
    dot_str += _generate_oneLayer(path)
    for d in dir:
        dot_str += _generate_Full(path + '/' + d)
    
    dot_str += '}'
    return dot_str


dot_code = generate_DOT(path)
print(dot_code)
