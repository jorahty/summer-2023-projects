const { createClient } = supabase;

const client = createClient(
  'https://zkbrnhxejirxsnofysug.supabase.co',
  'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InprYnJuaHhlamlyeHNub2Z5c3VnIiwicm9sZSI6ImFub24iLCJpYXQiOjE2ODk4NDI5NTcsImV4cCI6MjAwNTQxODk1N30.QlLoSEEZpQ9Yo1GnvbmcC6z-g9oI-SNPVf2_nMCckd8'
);

// HTML Elements

const loginButton = document.getElementById('signInBtn');
const whenSignedOut = document.getElementById('whenSignedOut');
const whenSignedIn = document.getElementById('whenSignedIn');
const userDetails = document.getElementById('userDetails');
const logoutButton = document.getElementById('signOutBtn');
const myThingsSection = document.getElementById('myThings');
const myThingsList = document.getElementById('myThingsList');
const createThing = document.getElementById('createThing');
const allThingsSection = document.getElementById('allThings');
const allThingsList = document.getElementById('allThingsList');

// Event Listeners

loginButton.onclick = () => {
  client.auth.signInWithOAuth({
    provider: 'google',
  });
};

logoutButton.onclick = () => {
  client.auth.signOut();
};

createThing.onclick = async () => {
  const {
    data: { user },
  } = await client.auth.getUser();
  const thing = createRandomThing(user);
  await client.from('things').insert([thing]);
};

// Initialize

checkUserOnStartUp();
let myThingsSubscription;
const myThings = {};
const allThings = {};
getAllInitialThings().then(() => listenToAllThings());

client.auth.onAuthStateChange((_event, session) => {
  if (session?.user) {
    adjustForUser(user);
  } else {
    adjustForNoUser();
  }
});

// Function Declarations

async function checkUserOnStartUp() {
  const {
    data: { user },
  } = await client.auth.getUser();
  if (user) {
    adjustForUser(user);
  } else {
    adjustForNoUser();
  }
}

async function adjustForUser(user) {
  whenSignedIn.hidden = false;
  whenSignedOut.hidden = true;
  myThingsSection.hidden = false;

  const { full_name, avatar_url } = user.user_metadata;
  userDetails.innerHTML = `
    <h3>Hi ${full_name}!</h3>
    <img src="${avatar_url}" />
    <p>UID: ${user.id}</p>
  `;

  await getMyInitialThings(user);
  listenToMyThingsChanges(user);
}

function adjustForNoUser() {
  whenSignedIn.hidden = true;
  whenSignedOut.hidden = false;
  myThingsSection.hidden = true;
  if (myThingsSubscription) {
    myThingsSubscription.unsubscribe();
    myThingsSubscription = null;
  }
}

async function getAllInitialThings() {
  const { data: things } = await client.from('things').select();
  for (const thing of things) {
    allThings[thing.id] = thing;
  }
  renderAllThings();
}

function renderAllThings() {
  const tableHeader = `
    <thead>
      <tr>
        <th>Name</th>
        <th>Weight</th>
      </tr>
    </thead>
  `;

  const tableBody = Object.values(allThings)
    .sort((a, b) => b.weight - a.weight)
    .map(
      (thing) => `
      <tbody>
        <tr>
          <td>${thing.name}</td>
          <td>${thing.weight} lbs.</td>
        </tr>
      </tbody>
      `
    )
    .join('');

  const table = `
    <table>
      ${tableHeader}
      ${tableBody}
    </table>
  `;

  allThingsList.innerHTML = table;
}

function createRandomThing(user) {
  if (!user) {
    console.log('Must be signed in to create a thing');
    return;
  }

  return {
    name: faker.commerce.productName(3),
    weight: Math.round(Math.random() * 100),
    owner: user.id,
  };
}

function handleAllThingsUpdate(update) {
  if (update.eventType === 'DELETE') {
    delete allThings[update.old.id];
  } else {
    allThings[update.new.id] = update.new;
  }
  renderAllThings();
}

function listenToAllThings() {
  client
    .channel('public:things')
    .on(
      'postgres_changes',
      { event: '*', schema: 'public', table: 'things' },
      handleAllThingsUpdate
    )
    .subscribe();
}

async function getMyInitialThings(user) {
  const { data: things } = await client
    .from('things')
    .select('*')
    .eq('owner', user.id);
  for (const thing of things) {
    myThings[thing.id] = thing;
  }
  renderMyThings();
}

function handleMyThingsUpdate(update) {
  if (update.eventType === 'DELETE') {
    delete myThings[update.old.id];
  } else {
    myThings[update.new.id] = update.new;
  }
  renderMyThings();
}

async function listenToMyThingsChanges(user) {
  if (myThingsSubscription) return;

  myThingsSubscription = client
    .channel(`public:things:owner=eq.${user.id}`)
    .on(
      'postgres_changes',
      {
        event: '*',
        shcema: 'public',
        table: 'things',
        filter: `owner=eq.${user.id}`,
      },
      handleMyThingsUpdate
    )
    .subscribe();
}

function renderMyThings() {
  const tableHeader = `
    <thead>
      <tr>
        <th>Name</th>
        <th>Weight</th>
        <th></th>
      </tr>
    </thead>
  `;

  const tableBody = Object.values(myThings)
    .sort((a, b) => b.weight - a.weight)
    .map(
      (thing) => `
      <tbody>
        <tr>
          <td>${thing.name}</td>
          <td>${thing.weight} lbs.</td>
          <td>${deleteButtonTemplate(thing)}</td>
        </tr>
      </tbody>
      `
    )
    .join('');

  const table = `
    <table>
      ${tableHeader}
      ${tableBody}
    </table>
  `;

  myThingsList.innerHTML = table;
}

function deleteButtonTemplate(thing) {
  return `
    <button
      onclick="deleteAtId(${thing.id})"
    >
      ${trashIcon}
    </button>
  `;
}

async function deleteAtId(id) {
  await client.from('things').delete().eq('id', id);
}

const trashIcon = 'remove';
