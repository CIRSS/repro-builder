module.exports.exec = exec;

function exec(command) {
    
    const { spawn } = require('child_process');

    const tokens = command.split(/\s+/)
    const process = spawn(tokens[0], tokens.slice(1), { stdio: 'inherit' });
    
    process.on('close', (code) => {
        console.log(`Repro exited with code ${code}`);
    });            
}




