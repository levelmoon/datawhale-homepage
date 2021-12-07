import { createStore } from 'vuex';

interface IState {
  menuItemIndex: string;
}

const store = createStore({
  state() {
    return {
      menuItemIndex: '0'
    };
  },
  mutations: {
    setMenuItemIndex(state: IState, index: string) {
      state.menuItemIndex = index;
    }
  }
});

export default store;
